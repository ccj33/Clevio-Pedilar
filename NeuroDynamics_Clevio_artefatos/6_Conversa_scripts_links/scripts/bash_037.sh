# 2026-11-24 13:51 - Fetch remote branches and list all commits
for i in 1 2 3; do git fetch origin 2>&1 | tail -2 && break; sleep 2; done; git log --oneline --all | head -20; git log --oneline origin/main | head -5
