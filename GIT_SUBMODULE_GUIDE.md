# Git Submodule Rollback Guide / Git 子模块回滚指南

This guide explains how to revert a specific submodule to an older version (commit) without affecting the rest of your main repository (monorepo).
本指南说明如何在不影响主仓库其他部分的情况下，将特定子模块回滚到旧版本（提交）。

## Prerequisites / 前置条件
- You are in the root directory of your project (e.g., `wd-ai-all`).
- You have `git` installed.

## Steps / 步骤

### 1. Find the Target Commit Hash / 找到目标 Commit Hash
First, you need to know which commit hash the submodule *used to* point to in the main repository's history.
首先，你需要知道在主仓库的历史记录中，该子模块曾经指向哪个 commit hash。

```bash
# View log to find the parent repo commit you want to restore to
# 查看日志找到你想恢复到的主仓库 commit
git log --oneline

# Once you have the parent commit hash (e.g., c982b82), check what the submodule hash was
# 一旦有了主仓库 commit hash (例如 c982b82)，检查当时子模块的 hash
git ls-tree c982b82 projects/go-langchain-api
```
*Output example / 输出示例:*
`160000 commit 21a3c3786a666a76a15a9f26d0e557eb79e5734d  projects/go-langchain-api`
*(The long hash `21a3c37...` is what you need / 长串 hash 就是你需要的)*

### 2. Enter the Submodule Directory / 进入子模块目录
Navigate to the submodule folder.
进入子模块文件夹。

```bash
cd projects/go-langchain-api
```

### 3. Checkout the Target Hash / 检出目标 Hash
Checkout the specific hash you found in Step 1.
检出你在第一步找到的特定 hash。

```bash
git checkout 21a3c3786a666a76a15a9f26d0e557eb79e5734d
```
*Note: You will be in a "detached HEAD" state. This is normal for submodules.*
*注意：你会处于 "detached HEAD" 状态，这是子模块的正常现象。*

### 4. Update the Main Repository / 更新主仓库
Go back to the root directory and commit the change.
回到根目录并提交更改。

```bash
# Go back to root / 回到根目录
cd ../..

# Verify the change / 验证更改
git status
# You should see: modified: projects/go-langchain-api (new commits)

# Commit the rollback / 提交回滚
git add projects/go-langchain-api
git commit -m "chore: rollback submodule projects/go-langchain-api to <old-hash>"
```

### 5. (Optional) Verify / (可选) 验证
Check if the submodule is correctly pointing to the desired commit.
检查子模块是否正确指向了所需的 commit。

```bash
git submodule status projects/go-langchain-api
```

---
## Quick Reference / 快速参考
If you already know the hash:
如果你已经知道 hash：

```bash
cd projects/go-langchain-api
git checkout <COMMIT_HASH>
cd ../..
git add projects/go-langchain-api
git commit -m "update submodule ref"
```
