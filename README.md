# かんたんエコマップ (Easy Ecomap)

無料でエコマップを簡単に作成できるオンラインツールです。家族関係図やネットワーク図を直感的に描画・編集できます。

## 特徴

- 🎨 **直感的な操作**: ドラッグ&ドロップで簡単にエコマップを作成
- 🔗 **関係性の可視化**: 4種類の線で関係の強さを表現
- 💾 **柔軟な保存**: JSON形式（編集可能）とPNG形式（画像）で保存
- 🌐 **多言語対応**: 日本語・英語に対応
- 📱 **レスポンシブ**: あらゆるデバイスで快適に使用
- 🆓 **完全無料**: 登録不要で即座に利用開始

## クイックスタート

### 方法1: 開発サーバー起動スクリプト（推奨）

```bash
# 実行権限を付与（初回のみ）
chmod +x start-dev.sh

# 開発サーバーを起動
./start-dev.sh
```

### 方法2: npmスクリプト

```bash
# 依存関係をインストール
npm install

# 開発サーバーを起動
npm run dev
# または
npm start
```

### 方法3: Python HTTPサーバー

```bash
# Python 3を使用
python3 -m http.server 3000

# ブラウザで http://localhost:3000 を開く
```

## 利用可能なコマンド

| コマンド | 説明 |
|---------|------|
| `npm run dev` | 開発サーバーを起動（自動でブラウザを開く） |
| `npm start` | Python HTTPサーバーを起動 |
| `npm run start:live` | Live Serverを使用（ファイル変更を自動検知） |
| `npm run build` | 本番用ビルド（静的ファイルの準備完了） |
| `npm run lint` | HTMLファイルのリント |
| `npm run format` | コードの自動フォーマット |
| `npm run open` | ブラウザでアプリを開く |

## プロジェクト構造

```
easy-ecomap/
├── index.html              # メインアプリケーション
├── manual.html             # 操作マニュアル
├── faq.html                # よくある質問
├── privacy.html            # プライバシーポリシー
├── terms.html              # 利用規約
├── start-dev.sh            # 開発サーバー起動スクリプト
├── package.json            # プロジェクト設定
├── sitemap.xml             # サイトマップ
├── robots.txt              # 検索エンジン向け設定
└── .vscode/                # VSCode設定
    ├── tasks.json          # タスク定義
    ├── launch.json         # デバッグ設定
    └── settings.json       # エディタ設定
```

## 開発環境

### VSCode設定

プロジェクトにはVSCode用の設定ファイルが含まれています：

- **tasks.json**: 開発サーバー起動、リント、フォーマットなどのタスク
- **launch.json**: ブラウザでのデバッグ設定
- **settings.json**: エディタの自動設定

### 推奨拡張機能

- Live Server
- HTML CSS Support
- Prettier
- HTMLHint

## 使用方法

1. **項目の追加**: 「項目を追加」ツールを選択してキャンバスをクリック
2. **テキストの追加**: 「テキスト」ツールを選択してキャンバスをクリック
3. **関係線の描画**: 線の種類を選択して開始点から終了点までドラッグ
4. **編集**: 要素をダブルクリックしてテキストを編集
5. **保存**: 「保存」ボタンでJSONまたはPNG形式で保存

## 技術仕様

- **フロントエンド**: HTML5, CSS3, JavaScript (ES6+), React (CDN)
- **スタイリング**: Tailwind CSS
- **アイコン**: Lucide React Icons
- **開発サーバー**: Python HTTP Server / Live Server
- **デプロイ**: Vercel

## ライセンス

MIT License

## 作者

mochizuki masao

## サポート

- 📖 [操作マニュアル](manual.html)
- ❓ [よくある質問](faq.html)
- 🐛 [問題の報告](https://github.com/mochizuki/easy-ecomap/issues)
