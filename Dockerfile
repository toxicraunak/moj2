FROM ubuntu:22.04

# Install dependencies in separate RUN commands (better caching)
RUN apt-get update && apt-get install -y \
    wget curl git nano htop tmux python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install ttyd separately (with retry)
RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir ttyd

# Create user
RUN useradd -m -s /bin/bash termuser && \
    echo 'termuser:yourpassword' | chpasswd

EXPOSE 8080
CMD ["ttyd", "-p", "8080", "bash"]
