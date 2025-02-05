#!/bin/sh
setup_git() {
  git config --global user.email "litmuschaos@gmail.com"
  git config --global user.name "litmusbot"
}

commit_updated_changes() {
  git checkout v3.0.0-beta3
  git status
  git add .
  git commit --message " $GITHUB_RUN_ID: version upgraded for chaos-charts"
  git status
}

upload_files() {	
  git remote -v	
  git push origin v3.0.0-beta3
}

setup_git
commit_updated_changes
upload_files
