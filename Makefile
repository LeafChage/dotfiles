.PHONY: clean
clean:
	if [ -d /opt/nvim-linux64     ]; then rm -rf /opt/nvim-linux64;     fi
	if [ -d /opt/peco_linux_amd64 ]; then rm -rf /opt/peco_linux_amd64; fi
	if [ -d /opt/fzf              ]; then rm -rf /opt/fzf;              fi

.PHONY: all
all: nvim peco fzf rg jq

nvim:
	cd /tmp
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	tar -C /opt -xzf nvim-linux64.tar.gz
	@echo "======================"
	@echo "You need to path to /opt/nvim-linux64/bin"
	@echo "======================"

peco:
	cd /tmp
	curl -LO https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz
	tar -C /opt -zxvf ./peco_linux_amd64.tar.gz
	@echo "======================"
	@echo "You need to path to /opt/peco_linux_amd64"
	@echo "======================"

fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git /opt/fzf
	/opt/fzf/install --bin
	@echo "======================"
	@echo "You need to path to /opt/fzf/bin"
	@echo "======================"

rg:
	apt install -y ripgrep

jq:
	apt install -y jq
