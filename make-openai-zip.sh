#!/usr/bin/env bash
# ZIP плагіна для порталу OpenAI (platform.openai.com → Plugins → Upload new version).
# Версію підняти в усіх чотирьох маніфестах ДО збірки; після — тег vX.Y.Z + реліз з motyv.tar.gz (Gemini).
set -euo pipefail
cd "$(dirname "$0")"
out="${1:-$HOME/Desktop/motyv-openai-plugin.zip}"
rm -f "$out"
zip -qrX "$out" .codex-plugin .mcp.json skills assets README.md LICENSE
echo "$out ($(python3 -c 'import json;print(json.load(open(".codex-plugin/plugin.json"))["version"])'))"
