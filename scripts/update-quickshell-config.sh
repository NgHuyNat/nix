#!/usr/bin/env bash
# Script để update quickshell config từ end-4/dots-hyprland

set -e

DOTS_REPO="$HOME/Workspaces/Dev/dots-hyprland"
NIXOS_CONFIG="$HOME/Workspaces/Config/nixos"
QS_CONFIG="$NIXOS_CONFIG/modules/home-manager/features/quickshell/config"

echo "🔄 Updating dots-hyprland repo..."
cd "$DOTS_REPO"
git pull
git submodule update --init --recursive

echo "📦 Copying quickshell config..."
rm -rf "$QS_CONFIG/ii"
cp -r "$DOTS_REPO/dots/.config/quickshell/ii" "$QS_CONFIG/"

echo "✅ Config updated! Now rebuild with:"
echo "   cd $NIXOS_CONFIG && sudo nixos-rebuild switch --flake '.#nixos'"
