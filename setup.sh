#!/bin/bash

VENV_NAME="bootcamp-env"

echo "🔍 檢查目前環境..."
if type deactivate &> /dev/null; then
  echo "🔁 正在停用目前虛擬環境..."
  deactivate
fi

if [ -d "$VENV_NAME" ]; then
  echo "🗑️  移除舊的虛擬環境..."
  rm -rf "$VENV_NAME"
fi

echo "📦 建立新的虛擬環境..."
python3 -m venv "$VENV_NAME"

echo "✅ 啟動虛擬環境..."
source "$VENV_NAME/bin/activate"

echo "⬆️  更新 pip..."
python -m pip install --upgrade pip

echo "📥 安裝所需套件..."
pip install -r requirements.txt

echo "🔧 註冊 Jupyter Kernel 到 VS Code..."
pip install ipykernel
python -m ipykernel install --user --name="$VENV_NAME" --display-name "Python (bootcamp-env)"

echo "----------------------------------------"
echo "✅ 環境設定完成！"
python --version
pip --version
echo "目前環境: $VENV_NAME"
echo "----------------------------------------"
echo "下次使用時，直接執行： source bootcamp-env/bin/activate"