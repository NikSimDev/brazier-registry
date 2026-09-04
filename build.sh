#!/bin/bash
set -e

if [ -n "$VCPKG_ROOT" ]; then
    VCPKG_PATH="$VCPKG_ROOT"
else
    VCPKG_PATH="/tools/vcpkg"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORTS_PATH="${SCRIPT_DIR}/ports"

echo "Using vcpkg from: $VCPKG_PATH"
echo "Ports path: $PORTS_PATH"

rm -rf "$VCPKG_PATH/packages/brazier_x64-windows" 2>/dev/null || true
rm -rf "$VCPKG_PATH/buildtrees/brazier" 2>/dev/null || true

"$VCPKG_PATH/vcpkg" remove brazier:x64-windows --purge

"$VCPKG_PATH/vcpkg" install --overlay-ports="$PORTS_PATH" brazier --recurse --editable