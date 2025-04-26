# ──────────────────────────────────────────────────────────────
#  GitHub Pages local preview via Docker — zero host installs
# ──────────────────────────────────────────────────────────────
#
#  Workflow
#    make serve      # live-preview at http://localhost:4000
#    make build      # write static site into ./_site
#    make shell      # open an interactive shell in the container
#    make clean      # remove ./_site
#
#  The image is rebuilt every time (cheap: Docker layer cache).
# ──────────────────────────────────────────────────────────────

# ── Configurable knobs ────────────────────────────────────────
IMAGE      ?= gh-pages:latest
DOCKERFILE ?= Dockerfile.github-pages
PORT       ?= 4000
SITE_DIR   ?= _site

# Current user IDs so generated files are owned by you
USER_ID    := $(shell id -u)
GROUP_ID   := $(shell id -g)

# ── Targets ───────────────────────────────────────────────────
.PHONY: image serve build clean shell

## (Re)build the Docker image (always)
image:
	@echo "▶ Building container $(IMAGE)…"
	docker build -t $(IMAGE) -f $(DOCKERFILE) .

## Live-preview the site exactly like GitHub Pages
serve: image
	@echo "▶ Starting local GitHub Pages preview on port $(PORT)…"
	docker run --rm \
		-p $(PORT):$(PORT) \
		-v $(PWD):/site \
		-u $(USER_ID):$(GROUP_ID) \
		$(IMAGE) serve --watch --drafts --future \
			--host 0.0.0.0 --port $(PORT)

## Generate static HTML in ./$(SITE_DIR)
build: image
	@echo "▶ Building static site into $(SITE_DIR)…"
	docker run --rm \
		-v $(PWD):/site \
		-u $(USER_ID):$(GROUP_ID) \
		$(IMAGE) build --future

## Remove generated site output
clean:
	rm -rf $(SITE_DIR)

## Open an interactive shell inside the container (for debugging)
shell: image
	docker run --rm -it \
		-v $(PWD):/site \
		-u $(USER_ID):$(GROUP_ID) \
		$(IMAGE) /bin/bash

# --------------------------------------------------------------------
#  CI smoke-test: build inside the container and fail if it can’t
# --------------------------------------------------------------------
test: build
	@echo "▶ CI smoke-test — building inside container …"
	@docker run --rm \
		--entrypoint bash \
		-v $(PWD):/site \
		-e PAGES_REPO_NWO=dummy/dummy \
		-e JEKYLL_ENV=production \
		-e BUNDLE_FROZEN=true \
		$(IMAGE) \
			-c "set -e; \
					git config --global --add safe.directory /site; \
					jekyll build --future -d /tmp/out; \
					if [ -f /tmp/out/index.html ]; then \
								echo '✅ build OK'; \
					else \
								echo '❌ index.html missing'; \
								exit 1; \
					fi"
	@echo "▶ Smoke-test passed"
