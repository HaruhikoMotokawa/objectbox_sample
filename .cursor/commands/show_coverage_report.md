# カバレッジレポート生成・表示

添付されたファイル/ディレクトリのカバレッジを計測し、HTMLレポートをブラウザで表示する。

## ⚠️ 重要
全てのターミナルコマンドは `required_permissions: ["all"]` で実行すること。

## 実行手順

### 1. 添付確認
- 添付ファイル/ディレクトリが存在するか確認
- 存在しない場合 → 「カバレッジを計測したいファイルまたはディレクトリをチャットに添付してください」と表示して中断

### 2. テスト対象の特定
- **実装ファイル** (`lib/**/*.dart`) → 対応するテストファイルパス (`test/**/*_test.dart`) に変換
- **テストファイル** (`*_test.dart`) → そのまま使用
- **`lib/`ディレクトリ** → `test/`の対応ディレクトリに変換
- **`test/`ディレクトリ** → そのまま使用
- 対象をユーザーに表示

### 3. genhtml確認
```bash
which genhtml
```
- 存在しない場合 → インストール方法を案内して中断

### 4. テスト実行
```bash
cd <workspace> && fvm flutter test --coverage <test_paths>
```
- `<test_paths>`: 手順2で特定したテストファイル/ディレクトリ
- テスト失敗してもカバレッジ生成は継続

### 5. HTMLレポート生成
```bash
genhtml coverage/lcov.info -o coverage/html
```

### 6. カバレッジサマリー表示
```bash
lcov --summary coverage/lcov.info
```

### 7. ブラウザで開く
```bash
open coverage/html/index.html
```
- Linux: `xdg-open`、Windows: `start` を使用

### 8. 完了メッセージ
以下を表示（ギャル口調で）：
- テスト対象ファイル/ディレクトリ一覧
- カバレッジ率（サマリーから取得）
- HTMLレポートパス: `coverage/html/index.html`
- LCOVデータパス: `coverage/lcov.info`

## エラーハンドリング
- テストファイルが見つからない → その旨を表示して中断
- テスト失敗 → エラー表示してもカバレッジ生成は継続
- カバレッジ生成失敗 → 原因を説明して中断
