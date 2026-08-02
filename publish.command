#!/bin/zsh
# Double-click this file to publish the HUD to GitHub Pages.
cd "$(dirname "$0")"

echo "— Francotti HUD publish —"
git add -A
if ! git diff --cached --quiet; then
  git commit -m "Publish $(date '+%Y-%m-%d %H:%M')"
fi
if git push; then
  echo ""
  echo "✓ Published. Live in ~30–60 s at:"
  echo "  https://francotti.github.io/hud/"
  echo "  (force-refresh iPhone Safari to bypass cache)"
else
  echo ""
  echo "✗ Push failed — check the message above."
  echo "  First time? Create the 'hud' repo on github.com under your"
  echo "  account, then run once in Terminal:"
  echo "    git remote add origin https://github.com/francotti/hud.git"
  echo "    git push -u origin main"
fi
echo ""
read -k 1 -s "?Press any key to close..."
