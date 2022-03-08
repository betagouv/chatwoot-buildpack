#!/bin/bash
#
# install backends and storage
#

CURL="curl -L --retry 15 --retry-delay 2" # retry for up to 30 seconds

function fetch_chatwoot_dist() {
    local location="$1"
    local version="$2"
    echo "Chatwoot backend installed"
    local dist="chatwoot"
    local dist_url="https://github.com/chatwoot/chatwoot/archive/refs/tags/v${version}.tar.gz"
    echo $dist_url
    if [ -f "${CACHE_DIR}/dist/${dist}" ]; then
        echo "File is already downloaded"
    else
        ${CURL} -o "${CACHE_DIR}/dist/${dist}" "${dist_url}"
    fi
    tar xzf "$CACHE_DIR/dist/${dist}" -C "$location"
}
