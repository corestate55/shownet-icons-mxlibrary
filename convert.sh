#!/usr/bin/sh

SHOWNET_ICONS_DIR="shownet-icons"
SHOWNET_ICONS_SVG_DIR="${SHOWNET_ICONS_DIR}/svg"
SHOWNET_ICONS_XML_FILE="shownet-icons.xml"

CONVERTER="svg2mxlibrary"
CONVERTER_SUBMODULE_DIR="icon-collection-mxlibrary"
CONVERTER_DIR="$CONVERTER_SUBMODULE_DIR/$CONVERTER"
CONVERTER_MODULES_DIR="$CONVERTER_DIR/node_modules"

# update shownet-icons/svg2mxlibrary as submodule
echo "# Pull $CONVERTER submodule"
git submodule update --init --recursive

# install packages for svg2 mxlibrary
if [ ! -d "$CONVERTER_MODULES_DIR" ]; then
  echo "# Install $CONVERTER packages"
  CWD=$(pwd)
  cd "$CONVERTER_DIR" || exit
  npm install
  cd "$CWD" || exit
else
  echo "# Found $CONVERTER packages"
fi

# convert xvg files to mxlibrary file.
echo "# Convert svgs in $SHOWNET_ICONS_SVG_DIR into $SHOWNET_ICONS_XML_FILE"
node "$CONVERTER_DIR" -o "$SHOWNET_ICONS_XML_FILE" "$SHOWNET_ICONS_SVG_DIR"/*.svg
