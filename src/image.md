---
title: 'Working with images from CLI'
abstract: "Quick reference for common image manipulations that can be achieved from a CLI. This is useful for automatically processing many images in bulk."
---

# Requirements

Tools used throughout this document:

* [ImageMagick](https://imagemagick.org)
* [optipng](http://optipng.sourceforge.net/)
* [gifsicle](http://www.lcdf.org/gifsicle/)
* [jpegoptim](https://github.com/tjko/jpegoptim)

# Basic image manipulation

Converting, resizing, and rotating images can be done using ImageMagick.

## Converting images

```
convert image.jpg image.png
```

## Resizing images

The following command will resize the image and preserve the aspect ratio.

```
convert image.png -resize 500x500 image.png
```

Optionally, an exclamation mark can be added to force the specified size:

```
convert image.png -resize 500x500! image.png
```

## Rotating an image

```
convert image.png -rotate 90 image.png
```

# Optimizing images for the web

## Losslessly compress PNG

```
optipng -o7 -f4 -strip all -clobber image.png
```

## Losslessly compress GIF

```
gifsicle -03 image.gif
```

## Losslessly compress JPG

```
jpegoptim --strip-all image.jpg
```
