EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml .swiftlint.yml .gitlab-ci.yml
CANDIDATES := $(wildcard .??*) bin
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

info:
	@echo .DOTPATH: "$(DOTPATH)"
	@echo ''
	@echo .DOTFILES: "$(DOTFILES)"
	@echo ''

list:
	@echo "Show dotfiles"
	@echo '' 
	@$(foreach val, $(DOTFILES), echo $(val);)

install:
	@echo "Create Symlink" 
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);) 

clean:
	@echo "Unlink dotfiles"
	@$(foreach val, $(DOTFILES), unlink $(HOME)/$(val);) 