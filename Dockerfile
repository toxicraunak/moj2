FROM ubuntu:22.04

# 1. Install system dependencies first
RUN apt-get update && apt-get install -y \
    wget curl git nano htop tmux python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

# 2. Install ttyd using BINARY (more reliable than pip)
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 -O /usr/local/bin/ttyd \
    && chmod +x /usr/local/bin/ttyd

# 3. Create user
RUN useradd -m -s /bin/bash termuser \
    && echo 'termuser:tanji' | chpasswd

EXPOSE 8080
CMD ["ttyd", "-p", "8080", "bash"]
