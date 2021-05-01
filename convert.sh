#!/usr/bin/sh

SHOWNET_ICONS_ZIP="ShowNetIcons_2021.zip"
SHOWNET_ICONS_URL="https://shownet.interop.jp/download/$SHOWNET_ICONS_ZIP"
SHOWNET_ICONS_EXT_DIR="assets"
SHOWNET_ICONS_SVG_DIR=$SHOWNET_ICONS_EXT_DIR/release/svg
SHOWNET_ICONS_XML_FILE="shownet-icons.xml"

CONVERTER="svg2mxlibrary"
CONVERTER_SUBMODULE_DIR="icon-collection-mxlibrary"
CONVERTER_DIR=$CONVERTER_SUBMODULE_DIR/$CONVERTER
CONVERTER_MODULES_DIR=$CONVERTER_DIR/node_modules

# download and extract shownet icons
if [ ! -e $SHOWNET_ICONS_ZIP ]; then
  echo "# Download $SHOWNET_ICONS_ZIP"
  curl -OL $SHOWNET_ICONS_URL
else
  echo "# Found $SHOWNET_ICONS_ZIP"
fi

# extract shownet icons into assets dir
if [ ! -d $SHOWNET_ICONS_EXT_DIR ]; then
  echo "# Extract $SHOWNET_ICONS_ZIP into $SHOWNET_ICONS_EXT_DIR"
  mkdir -p $SHOWNET_ICONS_EXT_DIR
  unzip $SHOWNET_ICONS_ZIP -d $SHOWNET_ICONS_EXT_DIR
else
  echo "# Found $SHOWNET_ICONS_EXT_DIR"
fi

# download svg2mxlibrary as submodule
if [ ! -d $CONVERTER_SUBMODULE_DIR ]; then
  echo "# Pull $CONVERTER submodule"
  git submodule update --init --recursive
else
  echo "# Found $CONVERTER submodule"
fi

# install packages for svg2 mxlibrary
if [ ! -d $CONVERTER_MODULES_DIR ]; then
  echo "# Install $CONVERTER packages"
  CWD=$(pwd)
  cd $CONVERTER_DIR || exit
  npm install
  cd "$CWD" || exit
else
  echo "# Found $CONVERTER packages"
fi

# convert xvg files to mxlibrary file.
echo "# Convert svgs in $SHOWNET_ICONS_SVG_DIR into $SHOWNET_ICONS_XML_FILE"
node $CONVERTER_DIR -o $SHOWNET_ICONS_XML_FILE $SHOWNET_ICONS_SVG_DIR/*.svg
