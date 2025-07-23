#!/bin/bash

# LaTeX Alpine Docker Runner Script
# This script builds and runs the LaTeX Alpine container with current directory mounted

set -e

IMAGE_NAME="latex-alpine"
CONTAINER_NAME="latex-workspace"

echo "🐳 Building LaTeX Alpine Docker image..."
docker build -t $IMAGE_NAME .

echo "📁 Running container with current directory mounted..."
echo "📍 Working directory: $(pwd)"
echo "🔧 Available commands: pdflatex, xelatex, lualatex, make"
echo "📝 Example: cd test && pdflatex test.tex"
echo "🧪 Run tests: cd test && ./test-all.sh"
echo "🚪 Type 'exit' to leave the container"
echo ""

# Run container with current directory mounted
docker run --rm -it \
  --name $CONTAINER_NAME \
  -v "$(pwd):/workspace" \
  $IMAGE_NAME bash

echo "✅ Container session ended."