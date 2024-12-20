# Use the ARM-based Ubuntu image as the base
FROM arm64v8/ubuntu:20.04

# Install QEMU and other dependencies
RUN apt-get update && apt-get install -y \
    qemu-user-static \
    binfmt-support \
    libc6 \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

# Register QEMU for AMD64 emulation
RUN update-binfmts --enable qemu-x86_64

# Default command
CMD ["bash"]
