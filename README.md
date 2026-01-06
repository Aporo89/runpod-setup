# RunPod Ollama Setup

RunPodでローカルLLM（gpt-oss-20b等）を動かすためのセットアップ。

## セットアップ

### 1. RunPodでPodを起動
- [runpod.io](https://runpod.io) → **Pods** → **+ Deploy**
- GPU: **RTX 4090**（24GB）推奨
- Template: **RunPod Pytorch 2.x**

### 2. Webターミナルに接続
- Podの **Connect** → **Web Terminal**
- ターミナルが開いたら以下を実行

### 3. インストール
```bash
git clone https://github.com/Aporo89/runpod-setup.git
cd runpod-setup
bash scripts/setup.sh
source ~/.bashrc
```

### 4. LLMを実行
```bash
ollama pull gpt-oss:20b
ollama run gpt-oss:20b
```

### 5. Claude Code認証（オプション）
```bash
claude
# 表示されるURLをブラウザで開いて認証
```

## インストールされるもの

- [Ollama](https://ollama.com/) - ローカルLLMランタイム
- [Claude Code](https://claude.ai/code) - AIコーディングアシスタント
- Node.js 20

## 推奨GPU

| モデル | VRAM | GPU |
|--------|------|-----|
| gpt-oss:20b | 16GB+ | RTX 4090, A40 |
| llama3.1:8b | 8GB+ | RTX 4080, A4000 |
