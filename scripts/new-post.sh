#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 [--commit] \"Post Title\" [slug]"
  echo
  echo "Options:" 
  echo "  --commit, -c    git add && git commit the created post, then open it in your editor"
  exit 1
}

if [ $# -lt 1 ]; then
  usage
fi

commit=false
if [ "$1" = "--commit" ] || [ "$1" = "-c" ]; then
  commit=true
  shift || true
fi

if [ $# -lt 1 ]; then
  usage
fi

title="$1"
slug="${2:-}"
if [ -z "$slug" ]; then
  slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-|-$//g')
fi

date=$(date +%F)
mkdir -p posts
filename="posts/${date}-${slug}.qmd"

if [ -e "$filename" ]; then
  echo "File exists: $filename"
  exit 1
fi

cat > "$filename" <<'EOF'
title: "Post Title"
date: 2025-11-16
author: "Jonathan Pearce"
tags: []
draft: true
---

Write your post here.

EOF

# Replace the placeholder fields with actual values
sed -i "s/^title: \"Post Title\"/title: \"$title\"/" "$filename"
sed -i "s/^date: 2025-11-16/date: $date/" "$filename"

echo "Created $filename"

if [ "$commit" = true ]; then
  # stage and commit the new post
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    git add "$filename"
    git commit -m "Add post: $title" || echo "git commit failed (perhaps no changes)"
  else
    echo "Not a git repository; skipping commit."
  fi

  # open in editor (respect EDITOR/VISUAL variables, fall back to code)
  editor="${EDITOR:-${VISUAL:-code}}"
  if command -v "$editor" >/dev/null 2>&1; then
    "$editor" "$filename" &>/dev/null || true
  else
    echo "Editor '$editor' not found; open $filename manually."
  fi
fi
title: "$title"
date: $date
author: "Jonathan Pearce"
tags: []
draft: true
---

Write your post here.

EOF

echo "Created $filename"
