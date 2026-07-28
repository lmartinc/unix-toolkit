# Git Workflow Guide

This document describes the standard Git workflow used for developing the Unix Toolkit.

---

# Daily Development Workflow

## 1. Start your day

Ensure you are on the correct branch.

```bash
git status
git branch
```

Update your current branch with the latest changes from GitHub.

If working on `main`:

```bash
git checkout main
git pull
```

If working on a feature branch:

```bash
git checkout feature/my-feature
git pull origin feature/my-feature
```

---

# Creating a New Feature

Always create a feature branch from the latest `main`.

```bash
git checkout main
git pull
git checkout -b feature/my-feature
```

Example:

```bash
git checkout -b feature/installer
```

---

# During Development

View changed files.

```bash
git status
```

Review changes.

```bash
git diff
```

Stage changes.

```bash
git add .
```

or

```bash
git add filename
```

Commit.

```bash
git commit -m "Add installer directory cleanup"
```

Push your branch.

```bash
git push -u origin feature/installer
```

Subsequent pushes only require:

```bash
git push
```

---

# Keeping Your Branch Updated

Switch to main.

```bash
git checkout main
```

Pull latest changes.

```bash
git pull
```

Return to your branch.

```bash
git checkout feature/installer
```

Merge the latest main into your branch.

```bash
git merge main
```

Resolve conflicts if required.

---

# Completing a Feature

Ensure your branch is committed.

```bash
git status
```

Switch to main.

```bash
git checkout main
```

Update main.

```bash
git pull
```

Merge the feature.

```bash
git merge feature/installer
```

Push main.

```bash
git push
```

Delete the local branch.

```bash
git branch -d feature/installer
```

Delete the remote branch (optional).

```bash
git push origin --delete feature/installer
```

---

# Creating a Release Tag

Create a version tag.

```bash
git tag -a v1.0.0 -m "Bootstrap foundation complete"
```

Push the tag.

```bash
git push origin v1.0.0
```

List tags.

```bash
git tag
```

---

# Fresh Installation

Clone the repository.

```bash
git clone https://github.com/lmartinc/unix-toolkit.git
```

Change into the project.

```bash
cd unix-toolkit
```

Run the bootstrap script.

```bash
./bootstrap.sh
```

or manually:

```bash
./install.sh
```

---

# Useful Commands

Current status.

```bash
git status
```

View commit history.

```bash
git log --oneline --graph --decorate
```

Show all branches.

```bash
git branch
```

Show remote branches.

```bash
git branch -r
```

Switch branches.

```bash
git checkout branch-name
```

Create and switch to a new branch.

```bash
git checkout -b feature/new-feature
```

Fetch remote changes.

```bash
git fetch
```

Pull latest changes.

```bash
git pull
```

Push current branch.

```bash
git push
```

---

# Recommended Workflow

```
Start Day
    │
    ▼
git checkout main
git pull
    │
    ▼
For new feature:  git checkout -b feature/my-feature
Or switch to existing branch: git checkout feature/my-feature    │
    ▼
Develop
    │
    ▼
git add .
git commit
git push
    │
    ▼
Testing
    │
    ▼
Merge into main
    │
    ▼
git push
    │
    ▼
Delete feature branch
```

---

# Best Practices

* Keep `main` stable.
* Develop one feature per branch.
* Commit often with meaningful messages.
* Push regularly to GitHub.
* Test before merging.
* Tag important milestones.
* Delete completed feature branches.
* Pull before starting new work.
* Never develop directly on `main`.

---

# Current Unix Toolkit Workflow

Development Laptop (VS Code)

```
Edit Code
     │
     ▼
Git Commit
     │
     ▼
Git Push
```

↓

GitHub Repository

↓

Ansible Control Node

```
git pull
```

↓

Testing

↓

If changes are made on the control node:

```
git add .
git commit
git push
```

↓

Laptop

```
git pull
```

This keeps both environments synchronized while GitHub remains the single source of truth.


Scenario: You're still working on feature/installer

Let's say Monday ends like this:

git add .
git commit -m "Rename scripts to installer"
git push

Your work is now safely on GitHub, but still on feature/installer.

Tuesday morning

Go to your repository:

cd ~/git/unix-toolkit

Check where you are:

git status
git branch

If you're already on feature/installer, simply do:

git pull

That's it.

Git knows that your local feature/installer tracks origin/feature/installer (because of the git push -u origin feature/installer you did the first time).

So git pull means:

"Bring my local feature/installer up to date with GitHub's feature/installer."

No merge with main is involved.

Then continue working:

git add .
git commit -m "Flatten installer modules"
git push
When do you involve main?

Only when the feature is finished.

For example:

feature/installer
├── Rename scripts
├── Flatten installer
├── Update install.sh
├── Test
└── Documentation

Once you're happy with everything:

git checkout main
git pull
git merge feature/installer
git push

Now main contains the completed feature.

A typical week
Monday
-------
feature/installer
commit
push

Tuesday
--------
git pull
feature/installer
commit
push

Wednesday
----------
git pull
feature/installer
commit
push

Thursday
---------
git pull
feature/installer
commit
push

Friday
-------
Tests complete
↓
Merge to main
Why push every day?

Even if you don't merge to main, pushing to GitHub gives you:

A backup of your work.
The ability to switch machines if needed.
A complete history of your progress.
Protection if your laptop has an issue.

That's why we treat GitHub as the source of truth.

The only exception

Suppose while you're working on feature/installer, you also fix a bug directly in main (or someone else updates main).

Before finishing your feature, bring those changes into your branch:

git checkout main
git pull

git checkout feature/installer
git merge main

This keeps your feature branch current and helps avoid a big merge conflict later.

Your normal workflow will probably look like this

Start the day (Windows vscode machine)

git status
git pull

Work

git add .
git commit -m "Meaningful description"
git push

On ansible control node (RHEL Machine)
git status
git branch -a
git checkout -b feature/installer origin/feature/installer #Pull branch to rhelcont1
Test on rhelcont1
If error's fix on vscode machine and do cycle again.

Repeat until the feature is complete.