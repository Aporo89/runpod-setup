# ~/.bashrc - RunPod環境用

# 基本設定
export LANG=en_US.UTF-8
export EDITOR=vim
export HISTSIZE=10000
export HISTCONTROL=ignoredups

# プロンプト
PS1='\[\033[01;32m\]\u@runpod\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# エイリアス
alias ll='ls -la --color=auto'
alias gs='git status'
alias gpu='nvidia-smi'

# 作業ディレクトリ
cd /workspace 2>/dev/null || true
