# Install

git clone https://github.com/ThorD125/scripts


- bash:
echo 'export PATH="$HOME/scripts:$PATH"' >> ~/.bashrc
source ~/.bashrc

- zsh:
echo 'export PATH="$HOME/scripts:$PATH"' >> ~/.zshrc
source ~/.zshrc

## Update
cd scripts && git pull && chmod +x . -R && cd ..
