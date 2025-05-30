FROM ubuntu:22.04

# Install ttyd (web terminal) + essentials
RUN apt-get update && apt-get install -y \
    wget curl git nano htop tmux python3 python3-pip \
    && pip3 install ttyd \
    && rm -rf /var/lib/apt/lists/*

# Create user
RUN useradd -m -s /bin/bash termuser && \
    echo 'termuser:yourpassword' | chpasswd

# Start web terminal on port 8080
EXPOSE 8080
CMD ["ttyd", "-p", "8080", "bash"]
