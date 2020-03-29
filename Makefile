EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml .swiftlint.yml .gitlab-ci.yml
CANDIDATES := $(wildcard .??*) bin
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

info:
	@echo MAKE_VERSION: $(MAKE_VERSION)
	@echo ''
	@echo CURDIR: $(CURDIR)
	@echo ''
	@echo MAKEFILE_LIST: $(MAKEFILE_LIST)
	@echo ''
	@echo MAKECMDGOALS: $(MAKECMDGOALS)
	@echo ''
	@echo .VARIABLES: "$(.VARIABLES)"

list: ## Show dot files in this repo
	@echo $(DOTFILES)