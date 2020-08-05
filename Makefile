.PHONY: dev@start

PORT?=8833

COM_COLOR   = \033[0;34m
OBJ_COLOR   = \033[0;36m
OK_COLOR    = \033[0;32m
ERROR_COLOR = \033[0;31m
WARN_COLOR  = \033[0;33m
NO_COLOR    = \033[m

.DEFAULT_GOAL= help


help: 
	@grep -E '(^[a-zA-Z_@-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

## ----Initialize----

init@npm: package.json ## Run npm install
	npm install

## ----Development----
dev@start: init@npm  ## Start server
	json-server db.json -m ./node_modules/json-server-auth --port $(PORT)

