#!/bin/bash

# Script setup + upload ke GitHub

# Cek apakah ada pesan commit
if [ -z "$1" ]; then
  echo "❌ Harap masukkan pesan commit. Contoh:"
  echo "   ./git-setup-upload.sh \"first commit\""
  exit 1
fi

# URL remote repository
REMOTE_URL="https://github.com/dibimbing-satkom-indo/C--fundamental.git"

# Cek apakah sudah ada repo git
if [ ! -d ".git" ]; then
  echo "📦 Inisialisasi repo Git baru..."
  git init
  git branch -M main
  git remote add origin $REMOTE_URL
else
  echo "✅ Repo Git sudah ada, langsung commit & push"
fi

# Tambahkan semua perubahan
git add .

# Commit dengan pesan
git commit -m "$1"

# Push ke branch main
git push -u origin main
