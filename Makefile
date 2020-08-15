DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) $(wildcard .config/*)
EXCLUDE    := .git .gitignore .globalrc .lesskey .clang-format .config
DOTFILES   := $(filter-out $(EXCLUDE), $(CANDIDATES))

.DEFAULT_GOAL := help

list: ## List dotfiles
	@$(foreach f, $(DOTFILES), /bin/ls -dF $(f);)

check: ## List files to be overwridden/removed
	@echo -- Follwing files will be overwridden or removed
	@$(foreach f, $(DOTFILES), /bin/ls -dF $(HOME)/$(f) 2>/dev/null;)

install: ## Create symlink to ~/ and ~/.config
	@if [ ! -d $(HOME)/.config ]; then mkdir -p $(HOME)/.config; fi
	@$(foreach f, $(DOTFILES), ln -sfnv $(abspath $(f)) $(HOME)/$(f);)

clean: ## Remove the dot files in ~/ and ~/.config
	@-$(foreach f, $(DOTFILES), rm -vrf $(HOME)/$(f);)

help: ## This help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'
