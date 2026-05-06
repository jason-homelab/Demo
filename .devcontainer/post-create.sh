#!/bin/bash
set -e

echo "🚀 Starting DevOps environment initialization..."

# 更新 pip
echo "📦 Upgrading pip..."
pip3 install --upgrade pip

# 安装 Python 开发工具
echo "🐍 Installing Python development tools..."
pip3 install --user --upgrade \
    checkov \
    tflint \
    pylint \
    black \
    isort \
    ansible-lint

# 验证关键工具
echo "✅ Verifying installed tools..."
echo "Python: $(python3 --version)"
echo "Terraform: $(terraform --version | head -1)"
echo "kubectl: $(kubectl version --client --short 2>/dev/null || echo 'kubectl ready')"
echo "Helm: $(helm version --short 2>/dev/null || echo 'Helm ready')"
echo "AWS CLI: $(aws --version)"
echo "Ansible: $(ansible --version | head -1)"

# 配置 git
echo "🔧 Configuring git for workspace..."
git config --global --add safe.directory /workspace || true

echo "✅ Environment initialization completed successfully!"
