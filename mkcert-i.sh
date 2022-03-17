
sudo rm /home/$USER/temp/mkcert
curl https://github.com/FiloSottile/mkcert/releases/latest | grep "https://github.com/FiloSottile/mkcert/releases/tag/v" | grep -Eo 'https://[^\"]*' | grep -Eo 'v[0-9.]+' | xargs -I"{}" echo https://github.com/FiloSottile/mkcert/releases/download/{}/mkcert-{}-linux-amd64 | xargs -I"{}" wget {} -O /tmp/mkcert

# Move it to the path
sudo cp /tmp/mkcert /usr/local/bin/mkcert
sudo cp /tmp/mkcert /home/$USER/.local/share/mkcert

# Grant execute permissions
sudo chmod +x /usr/local/bin/mkcert
sudo chmod +x /home/$USER/.local/share/mkcert

# Test if it succeeds
mkcert -CAROOT

# Cleanup
sudo rm /tmp/mkcert