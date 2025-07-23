# LaTeX Alpine Docker 🐳📚

A minimalistic LaTeX environment built on Alpine Linux with comprehensive language support including Russian (Cyrillic). Perfect for document compilation, exam preparation, and academic writing.

## 🚀 Features

- **Minimal Size**: Based on Alpine Linux for smallest possible image
- **Multiple Engines**: pdflatex, xelatex, lualatex support
- **Language Support**: English, Russian (Cyrillic), Unicode symbols
- **Font Support**: DejaVu fonts for proper Cyrillic rendering
- **Math & Graphics**: Full support for mathematical formulas and TikZ graphics
- **Exam Template**: Ready-to-use Russian exam preparation template
- **Easy Testing**: Comprehensive test suite included

## 📦 What's Included

### LaTeX Engines
- `pdflatex` - Standard LaTeX compiler
- `xelatex` - Unicode-aware compiler with modern font support
- `lualatex` - Lua-enhanced compiler with advanced features

### Packages
- Core LaTeX distribution (`texlive`)
- Mathematical packages (`amsmath`, `amsfonts`, `amssymb`)
- Language support (`polyglossia`, `fontspec`)
- Graphics support (`tikz`, `pgfplots`, `graphicx`)
- Document formatting (`geometry`, `fancyhdr`, `titlesec`)

### Fonts
- DejaVu Serif, Sans, and Mono with Cyrillic support
- Liberation fonts

## 🏃‍♂️ Quick Start

### Prerequisites
- Docker installed on your system

### Build and Run

```bash
# Clone or download this repository
# Navigate to the project directory

# Make run script executable
chmod +x run.sh

# Build and enter container
./run.sh
```

### Test Everything

```bash
# Inside container
cd test
chmod +x test-all.sh
./test-all.sh
```

## 📁 Project Structure

```
.
├── Dockerfile              # Alpine-based LaTeX image
├── run.sh                   # Container runner script
├── .gitignore              # Git ignore for LaTeX temp files
├── README.md               # This file
└── test/                   # Test documents and templates
    ├── test.tex            # Basic pdflatex test
    ├── test-pdflatex-unicode.tex  # pdflatex with symbols
    ├── test-unicode-simple.tex    # Simple Unicode test
    ├── test-unicode.tex           # Full Unicode + CJK
    ├── test-russian.tex           # Russian language test
    ├── exam-template.tex          # Comprehensive exam template
    └── test-all.sh               # Test runner script
```

## 📝 Usage Examples

### Basic Document Compilation

```bash
# Enter container
./run.sh

# Compile different document types
cd test
pdflatex test.tex                    # Basic LaTeX
pdflatex test-pdflatex-unicode.tex   # pdflatex with symbols
xelatex test-unicode-simple.tex      # Simple Unicode
lualatex test-unicode-simple.tex     # Modern Unicode
xelatex test-russian.tex             # Russian document
xelatex exam-template.tex            # Exam preparation
```

### Working with Your Documents

```bash
# Your documents in current directory are mounted to /workspace
./run.sh

# Compile your document
pdflatex my-document.tex

# For documents with table of contents, run twice
xelatex my-thesis.tex
xelatex my-thesis.tex
```

### Exam Preparation Template

The included `exam-template.tex` provides:
- Russian title page with student/course information
- Table of contents
- Structured chapters for exam topics
- Mathematical formulas and equations
- Graphics and plots with TikZ
- Professional formatting

```bash
# Customize the template
cp test/exam-template.tex my-exam-prep.tex
# Edit with your content
xelatex my-exam-prep.tex
xelatex my-exam-prep.tex  # Second run for TOC
```

## 🧪 Testing

The project includes comprehensive tests for all engines:

```bash
./run.sh
cd test
./test-all.sh
```

**Expected output:**
- ✓ pdflatex: SUCCESS - test.pdf created
- ✓ pdflatex Unicode: SUCCESS - test-pdflatex-unicode.pdf created
- ✓ xelatex: SUCCESS - test-unicode-simple.pdf created
- ✓ lualatex: SUCCESS - test-unicode-simple.pdf created
- ✓ Russian XeLaTeX: SUCCESS - test-russian.pdf created
- ✓ Exam template: SUCCESS - exam-template.pdf created

## 🔧 Advanced Usage

### Multiple Compilation Passes

For documents with cross-references, bibliography, or table of contents:

```bash
# Standard approach
xelatex document.tex
xelatex document.tex

# With bibliography
xelatex document.tex
bibtex document
xelatex document.tex
xelatex document.tex
```

### Custom Fonts

To use additional fonts, mount a fonts directory:

```bash
docker run --rm -it \
  -v "$(pwd):/workspace" \
  -v "/path/to/fonts:/usr/share/fonts/custom" \
  latex-alpine bash
```

### Makefile Support

The container includes `make` for complex build workflows:

```bash
# If you have a Makefile
make pdf
make clean
```

## 🌍 Language Support

### Russian (Cyrillic)
- Full alphabet support: А-Я, а-я
- Proper hyphenation and typography
- Mixed language documents (English + Russian)
- Academic formatting

### Unicode
- Mathematical symbols: ∑ ∫ ∞ ≤ ≥ ≠
- European characters: café, naïve, Größe, niño
- Currency symbols: € £ ¥
- Arrows and special symbols: → ← ⇒ ⇐

## 🐛 Troubleshooting

### Font Issues
If you encounter font errors:
```bash
# Check available fonts
fc-list | grep -i dejavu

# Use simpler fonts in your document
\setmainfont{DejaVu Serif}
```

### Missing Packages
If you need additional packages:
```bash
# Check available packages
apk search texmf-dist

# Add to Dockerfile and rebuild
RUN apk add --no-cache texmf-dist-package-name
```

### Compilation Errors
- Always run LaTeX twice for documents with TOC
- Check `.log` files for detailed error information
- Ensure proper encoding for non-ASCII characters

## 📋 Requirements

- Docker
- ~300MB disk space for the image
- Text editor for LaTeX documents

## 🤝 Contributing

Contributions are welcome! Please:
1. Test your changes with `./test/test-all.sh`
2. Update documentation as needed
3. Follow the existing code style

### Adding New Templates
1. Create new `.tex` file in `test/` directory
2. Add test case to `test-all.sh`
3. Update usage examples in README

## 📄 License

This project is open source. The LaTeX distribution and fonts have their respective licenses.

## 🏷️ Tags

`latex` `docker` `alpine` `russian` `cyrillic` `mathematics` `academic` `minimal` `unicode` `exam-preparation`

---

**Happy LaTeX writing! 🎓📝**