#!/bin/bash

# LaTeX Alpine Docker Runner Script
# This script builds and runs the LaTeX Alpine container with current directory mounted

set -e

IMAGE_NAME="latex-alpine"
CONTAINER_NAME="latex-workspace"

#echo "🐳 Building LaTeX Alpine Docker image..."
#docker build -t $IMAGE_NAME .

# Determine the command to run based on whether a parameter was provided
if [ -n "$1" ]; then
  LATEX_CMD="pdflatex $1"
  echo "📝 Compiling specific file: $1"
else
  LATEX_CMD='for f in *.tex; do pdflatex "$f"; done'
  echo "📝 Compiling all .tex files in current directory"
fi

echo "📁 Running container with current directory mounted..."
echo "📍 Working directory: $(pwd)"
echo "🔧 Available commands: pdflatex, xelatex, lualatex, make"
echo "📝 Example usage: $0 [filename.tex]"
echo "🧪 Run tests: cd test && ./test-all.sh"
echo "🚪 Type 'exit' to leave the container"
echo ""

# Run container with current directory mounted
docker run --rm -it \
  --name $CONTAINER_NAME \
  -v "$(pwd):/workspace" \
  -w /workspace \
  $IMAGE_NAME sh -c "$LATEX_CMD" && rm -f *.aux *.log

echo "✅ Container session ended."
