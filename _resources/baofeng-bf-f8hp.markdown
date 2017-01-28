---
layout: page
title: "Baofeng BF-F8HP guide"
---

Simple guide for manually programming the [BF-F8HP](https://baofengtech.com/bf-f8hp) radio.

For using the [chirp](http://chirp.danplanet.com/projects/chirp/wiki/Home) command line see the [chirpc guide](/resources/chirpc-guide/)

## Programming channels

1. Select "frequency mode" with the `VFO/MR` button
1. Select the top frequency slot "A" with the `A/B` button
1. Set CTCSS tone setting if required: `MENU` > `13`
1. Set offset direction under `SFT-D` menu: `MENU` > `25` and set `+` or `-` (or `OFF`). Frequencies less than 147 MHz have a negative offset and greater than that have a positive offset
1. Set OFFSET: `MENU` > `26` and should be 0 or 0.600 (600kHz) for [2m band](https://en.wikipedia.org/wiki/2-meter_band) (144-148MHz), or 5.000 (5MHz) for [70cm band](https://en.wikipedia.org/wiki/70-centimeter_band) (420-450MHz)
1. Save settings to a channel: `MENU` > `27` and select channel to write to

[BF-F8HP Manual](https://baofengtech.com/usermanual/BF-F8HP_Manual.pdf)

### Menus

| `2`  | `TXP`    | transmit power; `HIGH`, `MID`, `LOW` |
| `13` | `CTCSS`  | set CTCSS frequency |
| `18` | `SC-REV` | scanning mode; time `TO`, carrier `CO`, or search `SE` |
| `25` | `SFT-D`  | offset direction `+`, `-`, `OFF` |
| `26` | `OFFSET` | offset amount; usually 0.600 or 5.000 |
| `27` | `MEM-CH` | save channel |

### FRS Channels and codes

So those cheap two-way FRS/GMRS radios use the same 2m UHF bands and use CTCSS for the "privacy" code... which amusingly isn't private as anyone tuned to the same frequency can hear the transmission. For example, a FRS radio on channel 4-2 is using simplex frequency of 462.6375MHz and a CTSCSS of 71.9Hz. 14-4 would be 467.7125MHz and 77.0Hz. A radio receiving on 462.6375MHz will pick up all signals including those sent with a "privacy code" (or as the Motorola manual calls it an "interference eliminator tone") but the FRS radio won't output audio unless the matching CTCSS code is set.

[Motorola MS350 Series Guide ](http://www.motorolasolutions.com/content/dam/msi/docs/business/products/consumertwo-wayradios/talkabout_ms350r/ms350_series_ug_kem-ml36100-15_web_04-11-11.pdf)
