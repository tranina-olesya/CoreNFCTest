init:
	# Install bundler if not installed
	
	if ! gem spec bundler > /dev/null 2>&1; then\
  		echo "bundler gem is not installed! Run gem install bundler to install it";\
  		-sudo gem install bundler;\
	fi
	-bundle install --path .bundle
	-bundle exec pod repo update
	-bundle exec pod install
	-bundle exec generamba template install

	# Install git hooks
	mkdir -p .git/hooks
	ln -s -f ../../commit-msg .git/hooks/commit-msg
	chmod +x .git/hooks/commit-msg

## Used to create a new coordinator with folder for a new flow. Example: make coordinator modName=<CoordinatorName>
coordinator:
	bundle exec generamba gen $(modName) surf_mvp_coordinator

## Used to create a new module. Example: make screen modName=<ModuleName> flow=<FlowName>
screen:
	bundle exec generamba gen $(modName) surf_mvp_module --module_path '/CoreNFCTest/Flows/$(flow)'

## Used to create a new alert. Example: make alert modName=<AlertName> flow=<FlowName>
alert:
	bundle exec generamba gen $(modName) surf_mvp_coordinatable_alert --module_path '/CoreNFCTest/Flows/$(flow)' --test_path 'CoreNFCTestTests/Tests/Flows/$(flow)'

## Convert groups to folders if needed and sort with alphabetic order
synx:
	bundle exec synx --exclusion "CoreNFCTest/Non-iOS Resources" CoreNFCTest.xcodeproj

## Allows you to perfrom swiftlint autocorrect command.
format:
	./Pods/SwiftLint/swiftlint autocorrect --config .swiftlint.yml

## Run SwiftLint check
lint:
	./Pods/SwiftLint/swiftlint lint --config .swiftlint.yml

## Execute pod install command
pod:
	-bundle exec pod install

## Default configuration for beta command
config ?= debug

# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)


TARGET_MAX_CHAR_NUM=20
## Show help
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
