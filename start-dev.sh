#!/bin/bash

# Easy Ecomap Development Server Startup Script
# This script starts a local development server and opens the application in the browser

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if a port is in use
port_in_use() {
    lsof -i :$1 >/dev/null 2>&1
}

# Function to kill process on port
kill_port() {
    if port_in_use $1; then
        print_warning "Port $1 is already in use. Attempting to free it..."
        lsof -ti :$1 | xargs kill -9 2>/dev/null || true
        sleep 2
    fi
}

# Main function
main() {
    print_status "Starting Easy Ecomap Development Server..."

    # Check if we're in the right directory
    if [ ! -f "index.html" ]; then
        print_error "index.html not found. Please run this script from the project root directory."
        exit 1
    fi

    # Set default port
    PORT=${1:-3000}

    # Kill any existing process on the port
    kill_port $PORT

    # Check for Python
    if command_exists python3; then
        PYTHON_CMD="python3"
    elif command_exists python; then
        PYTHON_CMD="python"
    else
        print_error "Python is not installed. Please install Python 3 to run the development server."
        exit 1
    fi

    print_status "Using $PYTHON_CMD to start the server on port $PORT"

    # Start the development server
    print_status "Starting HTTP server..."
    $PYTHON_CMD -m http.server $PORT &
    SERVER_PID=$!

    # Wait a moment for the server to start
    sleep 2

    # Check if the server started successfully
    if port_in_use $PORT; then
        print_success "Development server started successfully on port $PORT"
        print_status "Server PID: $SERVER_PID"

        # Open browser
        if command_exists open; then
            print_status "Opening browser..."
            open "http://localhost:$PORT"
        elif command_exists xdg-open; then
            print_status "Opening browser..."
            xdg-open "http://localhost:$PORT"
        else
            print_warning "Could not automatically open browser. Please navigate to http://localhost:$PORT"
        fi

        print_success "Development server is running!"
        print_status "Press Ctrl+C to stop the server"

        # Wait for user to stop the server
        trap 'print_status "Stopping development server..."; kill $SERVER_PID 2>/dev/null; print_success "Server stopped."; exit 0' INT

        # Keep the script running
        wait $SERVER_PID

    else
        print_error "Failed to start the development server on port $PORT"
        exit 1
    fi
}

# Help function
show_help() {
    echo "Easy Ecomap Development Server"
    echo ""
    echo "Usage: $0 [PORT]"
    echo ""
    echo "Arguments:"
    echo "  PORT    Port number to run the server on (default: 3000)"
    echo ""
    echo "Examples:"
    echo "  $0        # Start server on port 3000"
    echo "  $0 8000   # Start server on port 8000"
    echo ""
    echo "Options:"
    echo "  -h, --help    Show this help message"
    echo ""
}

# Parse command line arguments
case "${1:-}" in
    -h|--help)
        show_help
        exit 0
        ;;
    *)
        main "$@"
        ;;
esac
