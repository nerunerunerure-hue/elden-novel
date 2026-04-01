#!/bin/bash
# エルデンリング二次創作小説 — 自動生成スクリプト
# claude -p で非対話実行する

set -euo pipefail

# PATH設定（claude CLIが見つかるようにする）
export PATH="$HOME/.claude/local/bin:$HOME/.local/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"

cd "$(dirname "$0")"

# progress.jsonから次のエピソード番号を取得
NEXT_EP=$(python3 -c "import json; print(json.load(open('progress.json'))['next_episode'])")
PADDED_EP=$(printf "%03d" "$NEXT_EP")

echo "=== エピソード ${PADDED_EP} を生成します ==="

claude -p "progress.jsonを読み、次のエピソードを執筆してください。CLAUDE.mdの作業手順に従い、ロア資料を参照し、初稿→セルフレビュー→改稿の流れで進めてください。改稿版をepisodes/ep${PADDED_EP}.mdとして保存し、progress.jsonを更新してください。"

echo "=== エピソード ${PADDED_EP} の生成が完了しました ==="
