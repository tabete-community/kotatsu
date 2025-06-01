define HELP_TEXT
# ──────────────────────────────────────────────────────────────
#  GitHub Pages local preview via Docker - zero host installs
# ──────────────────────────────────────────────────────────────
#
#  Workflow
#    make serve      # live-preview at http://localhost:4000
#    make build      # write static site into ./_site
#    make shell      # open an interactive shell in the container
#    make clean      # remove ./_site
#    make test       # quick test made for CI to build inside the container
#    make lock       # update Gemfile.lock with current dependencies (might be needed after gem updates)
#
#  The image is rebuilt every time (cheap: Docker layer cache).
#
#  Using Podman instead of Docker?
#    make DOCKER=podman …
#
#  Example:
#    make serve DOCKER=podman
# ──────────────────────────────────────────────────────────────
endef

# ── Configurable knobs ────────────────────────────────────────
IMAGE      ?= gh-pages:latest
DOCKER	   ?= docker
DOCKERFILE ?= Dockerfile.github-pages
PORT       ?= 4000
SITE_DIR   ?= _site

# Current user IDs so generated files are owned by you
USER_ID    := $(shell id -u)
GROUP_ID   := $(shell id -g)

# ── Targets ───────────────────────────────────────────────────
.PHONY: help image serve build clean shell

# make help the default target
help: ## Show this help message
	$(info $(HELP_TEXT))
	@echo ""


## (Re)build the Docker image (always)
image:
	@echo "▶ Building container $(IMAGE)…"
	$(DOCKER) build -t $(IMAGE) -f $(DOCKERFILE) .

## Update Gemfile.lock with new dependencies
lock: image
	@echo "▶ Updating Gemfile.lock with new dependencies…"
	$(DOCKER) run --rm \
		--network=host \
		--entrypoint /bin/bash \
		-e BUNDLE_PATH=/tmp/bundle \
		-e BUNDLE_APP_CONFIG=/tmp/bundle \
		-e GEM_HOME=/tmp/bundle \
		-v $(PWD):/site \
		$(IMAGE) \
		-c "bundle update && \
				bundle install && \
				bundle lock --add-platform x86_64-linux arm64-darwin-22"

## Live-preview the site exactly like GitHub Pages
serve: build
	@echo "▶ Starting local GitHub Pages preview on port $(PORT)…"
	$(DOCKER) run --rm \
		-p $(PORT):$(PORT) \
		-v $(PWD):/site \
		-u $(USER_ID):$(GROUP_ID) \
		$(IMAGE) serve --watch --drafts --future \
			--host 0.0.0.0 --port $(PORT)

## Generate static HTML in ./$(SITE_DIR)
build: image
	@echo "▶ Building static site into $(SITE_DIR)…"
	$(DOCKER) run --rm \
		-v $(PWD):/site \
		-u $(USER_ID):$(GROUP_ID) \
		$(IMAGE) build --future

## Remove generated site output
clean:
	rm -rf $(SITE_DIR)

## Open an interactive shell inside the container (for debugging)
shell: image
	$(DOCKER) run --rm -it \
		--network=host \
		--entrypoint /bin/bash \
		-v /etc/group:/etc/group \
		-v /etc/passwd:/etc/passwd \
		-v $(PWD):/site \
		-u $(USER_ID):$(GROUP_ID) \
		$(IMAGE)

# --------------------------------------------------------------------
#  CI smoke-test: build inside the container and fail if it can't
# --------------------------------------------------------------------
test: build
	@echo "▶ CI smoke-test - building inside container …"
	@$(DOCKER) run --rm \
		--entrypoint /bin/bash \
		-v $(PWD):/site \
		-e PAGES_REPO_NWO=dummy/dummy \
		-e JEKYLL_ENV=production \
		-e BUNDLE_FROZEN=true \
		$(IMAGE) \
			-c "set -e; \
					git config --global --add safe.directory /site; \
					bundle exec jekyll build --future -d /tmp/out; \
					if [ -f /tmp/out/index.html ]; then \
								echo '✅ build OK'; \
					else \
								echo '❌ index.html missing'; \
								exit 1; \
					fi"
	@echo "▶ Smoke-test passed"
