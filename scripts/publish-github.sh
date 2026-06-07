#!/usr/bin/env bash
# Publish legaldays-skill to GitHub (public). Requires: gh auth login
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REPO_NAME="${1:-legaldays-skill}"
GITHUB_USER="${2:-}"

cd "$REPO_ROOT"

if ! command -v gh >/dev/null 2>&1; then
  echo "ERROR: Install GitHub CLI: brew install gh" >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "ERROR: Not logged into GitHub. Run: gh auth login" >&2
  exit 1
fi

if [ -z "$GITHUB_USER" ]; then
  GITHUB_USER=$(gh api user --jq .login)
fi

if [ ! -d .git ]; then
  git init
  git branch -M main
fi

git add -A
if git diff --cached --quiet; then
  echo "Nothing to commit."
else
  git commit -m "feat: LegalDays v1.0.0 — global business law agent skill"
fi

REMOTE="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"

if gh repo view "${GITHUB_USER}/${REPO_NAME}" >/dev/null 2>&1; then
  echo "Repo exists: ${GITHUB_USER}/${REPO_NAME}"
  git remote remove origin 2>/dev/null || true
  git remote add origin "$REMOTE"
  git push -u origin main
else
  gh repo create "$REPO_NAME" \
    --public \
    --source=. \
    --remote=origin \
    --push \
    --description "Global business-law radar agent skill for AI — official sources, India lens, saved briefs. By LawAired."
fi

echo ""
echo "Published: https://github.com/${GITHUB_USER}/${REPO_NAME}"
echo "Install:   npx skills add ${GITHUB_USER}/${REPO_NAME} -g"