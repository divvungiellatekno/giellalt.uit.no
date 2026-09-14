default:
    @just --list

# build podman image for local development
image:
    podman build -f Containerfile -t github-pages

# run the podman image, exposes port 4000. NOTE: Takes a long time on first build, and takes 15-20 seconds after each write to refresh!
dev:
    podman run --rm -it --name github-pages -v .:/srv/jekyll -e JEKYLL_ROOTLESS=1 -p 4000:4000 github-pages jekyll serve --incremental --host 0.0.0.0

# rebuild Slidev presentations and publish their local static output
slides:
    ./build-slidev.sh
    find presentations -type d -name '*-slidev' -exec sh -c 'if [ -f "$1/dist/index.html" ]; then cp -R "$1/dist/." "$1/"; fi' sh {} \;

# run shell in the running container (for debugging)
shell:
    podman exec -it github-pages /bin/bash

# run container, but with bash instead of jekyll (for debugging)
run-bash:
    podman run --rm -it -v .:/srv/jekyll -e JEKYLL_ROOTLESS=1 -p "4000:4000" github-pages /bin/bash
