# Minimalistic LaTeX Alpine Dockerfile
FROM alpine:latest

# Install essential packages, TeX Live, and fonts
RUN apk add --no-cache \
    texlive \
    texlive-xetex \
    texlive-luatex \
    texlive-binextra \
    texmf-dist-full \
    py3-pygments \
    inkscape \
    font-dejavu \
    font-liberation \
    make \
    bash \
    && rm -rf /var/cache/apk/*

# Set working directory
WORKDIR /workspace

# Default command
CMD ["bash"]