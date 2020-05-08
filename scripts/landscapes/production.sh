#!/bin/bash

## COLORS
BLUE='\033[1;34m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

# script variables
NOW_PROJECT_ID="QmNcAKR2eDra5gdh44JXSoYCgEnDrShyQBXtSRGybK6YnW"

# feedback
echo "ℹ️   Running production preparation"

# setup now deployment
[ ! -d "./.now" ] && mkdir ./.now
cp ./srcbuild/.now/project.json.template ./.now/project.json
sed -i.bak "s/__NOW_PROJECT_ID__/$NOW_PROJECT_ID/g" ./.now/project.json
rm ./.now/project.json.bak

# feedback
echo "ℹ️   Landscape preperation succesfully completed" 