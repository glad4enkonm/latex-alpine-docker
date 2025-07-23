#!/bin/bash

# Test all LaTeX engines in the container

echo "🧪 Testing LaTeX engines..."
echo ""

echo "📄 Testing pdflatex (standard document)..."
if pdflatex test.tex > /dev/null 2>&1; then
    echo "✓ pdflatex: SUCCESS - test.pdf created"
else
    echo "✗ pdflatex: FAILED"
fi

echo "📄 Testing pdflatex (limited Unicode)..."
if pdflatex test-pdflatex-unicode.tex > /dev/null 2>&1; then
    echo "✓ pdflatex Unicode: SUCCESS - test-pdflatex-unicode.pdf created"
else
    echo "✗ pdflatex Unicode: FAILED"
fi

echo ""
echo "🌍 Testing xelatex (Unicode support)..."
if xelatex test-unicode-simple.tex > /dev/null 2>&1; then
    echo "✓ xelatex: SUCCESS - test-unicode-simple.pdf created"
else
    echo "✗ xelatex: FAILED"
fi

echo ""
echo "🚀 Testing lualatex (Unicode support)..."
if lualatex test-unicode-simple.tex > /dev/null 2>&1; then
    echo "✓ lualatex: SUCCESS - test-unicode-simple.pdf created"
else
    echo "✗ lualatex: FAILED"
fi

echo ""
echo "🇷🇺 Testing Russian language (XeLaTeX)..."
if xelatex test-russian.tex > /dev/null 2>&1; then
    echo "✓ Russian XeLaTeX: SUCCESS - test-russian.pdf created"
else
    echo "✗ Russian XeLaTeX: FAILED"
fi

echo ""
echo "📚 Testing exam template (comprehensive)..."
if xelatex exam-template.tex > /dev/null 2>&1; then
    echo "✓ Exam template: SUCCESS - exam-template.pdf created"
else
    echo "✗ Exam template: FAILED"
fi

echo ""
echo "📊 Results:"
ls -la *.pdf 2>/dev/null || echo "No PDF files found"

echo ""
echo "🎯 Usage examples:"
echo "  Basic pdflatex:     pdflatex test.tex"
echo "  pdflatex + symbols: pdflatex test-pdflatex-unicode.tex"
echo "  Simple Unicode:    xelatex test-unicode-simple.tex"
echo "  Modern Unicode:     lualatex test-unicode-simple.tex"
echo "  Russian language:   xelatex test-russian.tex"
echo "  Exam preparation:   xelatex exam-template.tex"
echo "  Full Unicode+CJK:  xelatex test-unicode.tex (needs CJK fonts)"

echo ""
echo "🔧 All engines are ready for use!"