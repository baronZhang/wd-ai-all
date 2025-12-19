
#!/usr/bin/env bash
set -e

AGG_ROOT="$1"           # 聚合仓库根目录
SUBMODULE_PATH="$2"     # 子模块相对路径
REPO_URL="$3"           # 远程仓库 URL

if [ -z "$AGG_ROOT" ] || [ -z "$SUBMODULE_PATH" ] || [ -z "$REPO_URL" ]; then
  echo "Usage: restore-submodule <agg_root> <submodule_path> <repo_url>"
  exit 1
fi

# 校验父仓库
if [ ! -d "$AGG_ROOT/.git" ]; then
  echo "❌ $AGG_ROOT is not a git repository"
  exit 1
fi

cd "$AGG_ROOT"

# 安装 git
command -v git >/dev/null 2>&1 || { echo "❌ git not installed"; exit 1; }

echo "🔧 Restoring $SUBMODULE_PATH as submodule"

# ===== 1️⃣ 删除本地残留 =====
if [ -d "$SUBMODULE_PATH" ]; then
  echo "ℹ️ Cleaning existing directory $SUBMODULE_PATH"
  git submodule deinit -f "$SUBMODULE_PATH" || true
  git rm -f "$SUBMODULE_PATH" || true
  rm -rf ".git/modules/$SUBMODULE_PATH" || true
  rm -rf "$SUBMODULE_PATH"
fi

# ===== 2️⃣ 确保远程仓库至少有一次 commit =====
TMP_DIR=$(mktemp -d)
git clone "$REPO_URL" "$TMP_DIR"
cd "$TMP_DIR"

# 如果仓库为空
if [ -z "$(git rev-parse --verify HEAD 2>/dev/null)" ]; then
  echo "# $(basename $SUBMODULE_PATH)" > README.md
  git add README.md
  git commit -m "init: first commit"
  git branch -M main
  git push -u origin main
fi

cd - >/dev/null
rm -rf "$TMP_DIR"

# ===== 3️⃣ 添加 submodule =====
git submodule add "$REPO_URL" "$SUBMODULE_PATH"
git add .gitmodules "$SUBMODULE_PATH"
git commit -m "chore: restore submodule $SUBMODULE_PATH"

echo "✅ Submodule $SUBMODULE_PATH restored successfully!"
