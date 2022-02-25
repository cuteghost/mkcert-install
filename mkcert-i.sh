#!/bin/sh

# Make sure that prerequisits are met
sudo apt-get install wget curl libnss3-tools

# Download latest released binary
curl https://github.com/FiloSottile/mkcert/releases/latest | grep "https://github.com/FiloSottile/mkcert/releases/tag/v" | grep -Eo 'https://[^\"]*' | grep -Eo 'v[0-9.]+' | xargs -I"{}" echo https://github.com/FiloSottile/mkcert/releases/download/{}/mkcert-{}-linux-amd64 | xargs -I"{}" wget {} -O /home/$USER/temp/mkcert

# Move it to the path
sudo cp /home/$USER/temp/mkcert /usr/local/bin/mkcert
sudo cp /home/$USER/temp/mkcert /home/$USER/.local/share/mkcert

# Grant execute permissions
sudo chmod +x /usr/local/bin/mkcert
sudo chmod +x /home/$USER/.local/share/mkcert

# Test if it succeeds
mkcert -CAROOT

# Cleanup
sudo rm /home/$USER/temp/mkcert