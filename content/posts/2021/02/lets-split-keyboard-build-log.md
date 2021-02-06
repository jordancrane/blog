---
title: "Let's Split Build Log (My First Mechanical Keyboard Build)"
date: 2021-02-06T13:10:41-08:00
draft: true
---

## Background and Requirements

For going on three years now I've been a faithful [ErgoDox EZ]() user and evangalist. I didn't understand why I could possibly want to spend several hundred dollars on keyboard _parts_ and then still have to put them all together using several hundred dollars worth of tools, when I could spend the same amount (or realistically, less) and get a pre-made solution that works just as well. But, as time has passed, my opinions on the ideal keyboard layout have grown gradually stronger (as I assume they tend to once you start using a programmable keyboard), and I'm finding myself wishing for configurations that aren't offered in a commercially manufactured keyboard. Namely, I'm plagued by two opinions which are inconvenient when held in tandem: firstly, that the ErgoDox has _too many keys_; and secondly, that split keyboards are intrinsically superior to traditional keyboards. Since there aren't any commercially available split mechanical keyboards with substantially fewer keys than the ErgoDox (to my knowledge at least), this meant that to scratch this itch I was going to have to seek out a custom solution. I've always found the [Planck]() keyboard to be an aesthetically pleasing keyboard---something about its symmetry and uniformity speaks to me, and it does away with the useless top row and 1u thumb cluster keys that plague the ErgoDox. So when I found out that there existed a design for a split version of the Planck called the [Let's Split](), I knew it was the one. Maybe not the one forever, but at least be the one I want to build first (I can already tell this is going to be a rabbit hole).

Having explained all that, here is a list of the requirements I was hoping to meet with this build:

- Split keyboard
- About 40% size (QWERTY keys plus an outer row on each side and a bottom row---48 keys)
- Quiet(er) operation (to facilitate working in coffee shops/coworking spaces post-COVID)
- Robust enough to throw in a backpack
- USB-C port for easy MacBook compatibility

## Build Notes

For the most part I followed the very well-done Let's Split [build guide](), with a few notable exceptions. Instead of using the open sandwich case prescribed in the guide, I chose to use the closed sandwich design available [here](), to improve the backpack-robustness factor. One important note on this point---if you are using a case material that is not the same on both sides (I used matte clear acrylic, which only has a matte finish on one side) you will want to use the modified design from [this PR](), which flips half of the top and bottom plates, otherwise one side of your keyboard will be smooth side facing out, and the other side will have the matte side facing out. The other change I made was to use the [Elite-C v4]() instead of the [Pro Micro](), because my desire for USB-C was stronger than my desire to not spend 2x as much money on microcontrollers. I also have not soldered since college so I am relearning it for this project, so it may not be the pretties (I'm writing this ahead of the assembly, so we'll find out together). I'm using leaded solder because I've heard it's easier to work with as a beginner, and I plan to just do a thorough desk cleaning post-assembly, but you'll have to assess the risk of doing so for yourself.

## Parts List

- Case (linked in previous section)
- [PCB]()
- [Elite-C v4] x 2
- [Diodes]()
- [TRRS Jacks]()
- [Boba U4 Silent Tactile Switches 68g]() x 48
- [10mm M2 Standoffs]() x 18
- [6mm M2 Hex Button Head Screws]() x 36
- [Rubber Feet]() x 8
- [Keycaps]()
- [24 AWG Wire]()
- [LED Strip]()
- [Switch Lube]() (if you're into that sort of thing)
- USB-C and TRRS cables
- Assorted tools and supplies (soldering stuff, switch opener, lube brushes, etc...)

## Assembling the Case

I did this first as a test fit because it got here first and I'm impatient. First you have to peel off all the plastic backing, which sounds fun but in reality is frustrating and really messed up my finger nails. The approach I took was to fasten the standoffs to the top plate and then stack the middle layers onto that, before attaching the bottom layer. In retrospect I probably should have fastened them to the bottom plate first instead, since I'll have to take the top plate off for assembly, and that will be difficult to do since the standoffs won't be anchored to the bottom plate and will turn freely. If you are more patient than I am this won't be an issue for you. 

## Assembling the PCB

Before beginning assembly of the PCB, flash your microcontrollers to ensure they aren't duds, since desoldering them is allegedly a PITA.

First, solder on the diodes and TRRS jacks (make sure to do it on the right side of the board for each half, they should be mirrored).

Then, attach the microcontroller headers.

Next, place the top plate over the PCB and solder in a switch on each corner, and the two switches whose pins reside under the microcontroller.

Lastly, solder in the microcontrollers and the rest of the switches.

## Adding RGB Lighting

This is one place where the guide is outdated. Instead you'll want to follow the instructions from [QMK]().

Basically, attach VCC and GND on the board to the corresponding pins on the LED strip, and then connect the TX0 pin on each microcontroller to the DIN pin on the LED strip. If you split the strip into multiple parts, just connect the VCC and GND from piece to piece, and DO to DIN.

## Finished Product

## Retrospective

