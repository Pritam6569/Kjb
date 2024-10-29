FROM gitpod/workspace-full

# Install required packages
RUN sudo apt-get update && sudo apt-get install -y \
    qemu-system-x86 \
    qemu-utils \
    ovmf \
    virt-manager \
    && sudo rm -rf /var/lib/apt/lists/*

# Set up KVM if available
RUN if [ -e /dev/kvm ]; then \
    sudo chmod 666 /dev/kvm; \
    fi

# Create directory for VM images
RUN mkdir -p /workspace/vm-images
