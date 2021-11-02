#!/bin/sh

echo "Cloning repositories..."

CODE_DIR=$HOME/Code

# Repositories
git clone git@github.com:gcw07/cwa-group.git $CODE_DIR/cwa-group
git clone git@github.com:gcw07/riggstree.git $CODE_DIR/riggstree
git clone git@github.com:gcw07/vue-tailwind-icons.git $CODE_DIR/vue-tailwind-icons
git clone git@github.com:gcw07/whm-server-tracker.git $CODE_DIR/whm-server-tracker