#!/bin/bash
# RunPod環境セットアップスクリプト
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== RunPod ML環境セットアップ ==="

# ----------------------------------------
# 1. パッケージリスト更新
# ----------------------------------------
echo "[1/4] パッケージリストを更新中..."
apt-get update -qq

# ----------------------------------------
# 2. bash設定
# ----------------------------------------
echo "[2/4] bash設定をインストール中..."
cp "$REPO_DIR/config/.bashrc" ~/.bashrc

# ----------------------------------------
# 3. Node.js & Claude Codeインストール
# ----------------------------------------
echo "[3/4] Claude Codeをインストール中..."
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
    apt-get install -y -qq nodejs
fi

if ! command -v claude &> /dev/null; then
    npm install -g @anthropic-ai/claude-code
fi

# ----------------------------------------
# 4. Ollamaインストール
# ----------------------------------------
echo "[4/4] Ollamaをインストール中..."
if ! command -v ollama &> /dev/null; then
    curl -fsSL https://ollama.com/install.sh | sh
fi

# Ollamaサーバー起動
ollama serve > /dev/null 2>&1 &
sleep 3

echo ""
echo "=== セットアップ完了 ==="
echo ""
echo "  source ~/.bashrc"
echo "  ollama pull gpt-oss:20b"
echo "  ollama run gpt-oss:20b"
echo ""
