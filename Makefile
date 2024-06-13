.PHONY: generate-schema

generate-schema:
	./bin/codegen/gen-openapi-schema.sh private

orval:
	NODE_OPTIONS='--no-deprecation' npx orval --config ./orval.config.ts