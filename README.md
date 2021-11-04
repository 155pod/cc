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
[ImageMagick][2] CLI. Once ImageMagick is installed you should be able to run
this in your terminal:

```sh
cd path/to/my/cc-project-root

convert <absolute-filepath-to-my-PNG> \
  -depth 8 \
  -type palette \
  -compress None \
  -strip \
  BMP3:graphics/<name-of-my-new-file>.bmp
```

[1]: https://gvaliente.github.io/butano/getting_started.html
[2]: https://imagemagick.org/index.php
