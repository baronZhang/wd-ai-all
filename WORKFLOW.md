# Git Submodule Collaboration Workflow

This guide outlines the correct workflow for using `bin/submodule-tool` in a multi-user, multi-machine environment to avoid common synchronization errors (like "not our ref").

## Key Concepts
- **`submodules.yaml` is the Source of Truth**: This file defines which submodules should exist and their URLs.
- **Superproject (`wd-ai-all`) stores Pointers**: The main project only knows "I need submodule X at commit hash Y". It does *not* store the submodule's code.
- **Submodule Remotes Store Code**: The actual code for submodule X lives in its own repository.

## The "Golden Rule" of Syncing
> **⚠️ Critical Rule**: You must **push changes to the submodule's remote repository** BEFORE you commit and push the updated pointer in the superproject (`wd-ai-all`).

If you push the superproject first, other users will try to download a commit hash that doesn't exist on the submodule's server yet, resulting in the `fatal: remote error: upload-pack: not our ref` error.

---

## Workflows

### 1. Setting Up (First Time / New Machine)
When you first clone the repo or pull a major update:
```bash
# 1. Pull the superproject
git pull

# 2. Sync submodules using the tool
# This inits, updates, and attempts to fix detached states.
./bin/submodule-tool sync .
```

### 2. Making Changes in a Submodule

**Step 1: Prepare the Submodule**
Submodules usually check out in a "Detached HEAD" state. To save work, you must be on a branch.
```bash
cd projects/my-submodule
git checkout main  # or your-feature-branch
git pull
```

**Step 2: Work and Push Submodule**
Make your changes, verify them, and **push to the submodule's remote**.
```bash
# Inside projects/my-submodule
git add .
git commit -m "feat: my new feature"
git push origin main
```
*Note: If you forget to push here, you will break the build for everyone else.*

**Step 3: Update Superproject**
Now that the submodule is safe on the server, update the superproject to point to this new commit.
```bash
cd ../.. # Back to root of wd-ai-all
git add projects/my-submodule
git commit -m "chore: update submodule pointer"
git push
```

### 3. Adding a New Submodule
To add a new service or library:

1.  **Update `submodules.yaml`**: Add the entry manually.
    ```yaml
    - path: projects/new-service
      repo: https://github.com/org/new-service.git
    ```
2.  **Apply Changes**:
    ```bash
    ./bin/submodule-tool apply .
    ```
    This will register the submodule and clone it.
3.  **Commit the Config**:
    ```bash
    git add submodules.yaml .gitmodules projects/new-service
    git commit -m "feat: add new-service submodule"
    git push
    ```

### 4. Resolving "Not Our Ref" Errors
If you or a colleague sees `fatal: remote error: upload-pack: not our ref`:

1.  **Identify the Culprit**: The error message tells you which submodule is broken (e.g., `projects/go-ai-service`).
2.  **Check with Colleague**: Ask whoever updated `wd-ai-all` last to **push their submodule changes**.
3.  **Emergency Fix (If blocked)**:
    If the code is lost or the person is unavailable, you can reset the submodule pointer to a known good commit:
    ```bash
    cd projects/broken-submodule
    git fetch
    git checkout origin/main
    cd ../..
    git add projects/broken-submodule
    git commit -m "fix: revert submodule pointer to available commit"
    ```

## Tool Command Reference

| Command | Usage |
| :--- | :--- |
| **`sync`** | Run this after `git pull` to update submodules. |
| **`apply`** | Run this after editing `submodules.yaml` to add/remove submodules. |
| **`clean`** | Removes submodules not listed in `submodules.yaml`. |
| **`list`** | Shows currently registered submodules. |
