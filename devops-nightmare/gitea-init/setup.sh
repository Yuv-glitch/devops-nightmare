#!/bin/bash
# Wait for Gitea to be ready
until curl -s http://gitea:3000 > /dev/null; do
  sleep 5
done

# 1. Create a repo via API (Simplified for demo)
# 2. Local Git config
git config --global user.email "dev@fastship.com"
git config --global user.name "Developer"

mkdir leak-repo && cd leak-repo
git init
echo "print('Deploying...')" > deploy.py
git add .
git commit -m "Initial commit"

# THE TRAP: Create the .env, commit it, then remove it
echo "JENKINS_API_TOKEN=11eb697920786d77894320987abcdef" > .env
echo "JENKINS_USER=admin" >> .env
git add .env
git commit -m "Added env vars for local testing"
git rm .env
git commit -m "Security: Removed sensitive .env file"

# In a real build, you'd push this to the gitea container