# 155CC

Right now this repository isn't much of anything. If you know what it's supposed
to be, you know what it's supposed to be.

## Prerequisites

Before you can contribute to this project, you'll need to set up a few things:

1. Follow the [Butano installation guide][1].

   You'll need to ensure that a C++ build environment, devkitARM, and Python are
   all working for you. Their documentation instructs you to test that ROM
   builds work, and it sure is a great way to test that everything's working
   okay.

2. Clone this project next to your local Butano clone.

   As part of the Butano installation, you'll have cloned Butano to your
   workstation.

   If you cloned Butano to `~/my-projects/butano` then this git repository
   should live in `~/my-projects/cc`. For now, this project depends on the
   Butano project root being cloned to `../butano`. It'd be great if this wasn't
   necessary in the future.

And that's it. You should be ready to contribute now.

## Creating compatible image assets

I was able to create compatible image assets from normal PNG files using the
[ImageMagick][2] CLI. Once ImageMagick is installed, it's just a matter of:

  1. Generating a color palette to be used in your BMP assets.
  2. Converting the PNG files to a paletted BMP3.

In your terminal:

```sh
# Ensure that you're at the root of your project directory first. My code
snippets will assume that that's the directory you're in.
cd path/to/my/cc-project-root

# Generate a palette file using ImageMagick.
# Perhaps in the future we can commit a shared palette that is acceptable.
convert \
  xc:red xc:lime xc:blue xc:cyan \
  xc:magenta xc:yellow xc:white xc:black \
  +append graphics/palette.gif

# Convert your asset(s) using ImageMagick.
convert <absolute-filepath-to-my-PNG> \
  -compress None \
  -depth 8 \
  -remap graphics/palette.gif \
  -strip \
  -type palette \
  BMP3:graphics/<name-of-my-new-file>.bmp
```

If you are importing a sprite and want your BMP to obey the background
transparency from your PNG, you can add a `-background None` flag to your
`convert` command:

```sh

convert <absolute-filepath-to-my-PNG> \
  -background None \
  -compress None \
  -depth 8 \
  -remap graphics/palette.gif \
  -strip \
  -type palette \
  BMP3:graphics/<name-of-my-new-file>.bmp
```

Using the same palette ensures we aren't accidentally loading dozens of similar
colours on a single screen. Loading colours takes up valuable VRAM.

[1]: https://gvaliente.github.io/butano/getting_started.html
[2]: https://imagemagick.org/index.php
