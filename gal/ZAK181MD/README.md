# ZAK181MD

ZAK181 SBC memory decoder PLD (GAL16V8). This chip decodes the memory bus
and generated chips selects for ROM, RAMs and video RAM. Handles ROM disable
circuit.

Chip is designed in GALasm that can be compiled to JEDEC via [Galette](https://github.com/simon-frankau/galette) -
source is in `zak181md.pld` file. Ready to program JEDEC file is provided in `zak181md.jed` file.

## Pinout

```
      -------\___/-------
   NC |  1           20 | VCC
      |                 |
  A19 |  2           19 | /RAM1
      |                 |
  A18 |  3           18 | /VRAM
      |                 |
  A17 |  4           17 | ROMDIS
      |                 |
  A16 |  5           16 | /RST
      |                 |
  A15 |  6           15 | NC
      |                 |
  A14 |  7           14 | /ROMCTRL
      |                 |
  A13 |  8           13 | /ROM
      |                 |
/MREQ |  9           12 | /RAM0
      |                 |
  GND | 10           11 | DAT
      -------------------
```

## Verification

GAL can be programmed and verified (test vectors functional test) via TL866 and [minipro](https://gitlab.com/DavidGriffith/minipro).

To program the chip (use appropriate chip designation):

```
$ minipro -p GAL16V8D -w zak181md.jed
```

Functional tests can be performed by:

```
$ minipro --logicic test.xml -TpZAK181MD
```

Expected output (all test vectors verified ok):

```
      1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20 
0000: X  X  X  X  X  X  X  X  1  G  X  X  X  1  X  0  X  X  X  V  
0001: X  X  X  X  X  X  X  X  1  G  X  H  H  1  X  1  L  H  H  V  
0002: X  1  1  1  1  1  1  1  0  G  X  H  H  1  X  1  L  L  H  V  
0003: X  0  0  0  0  0  0  0  0  G  X  H  L  1  X  1  L  H  H  V  
0004: X  0  0  0  0  0  1  1  0  G  X  L  H  1  X  1  L  H  H  V  
0005: X  1  0  0  0  0  1  1  0  G  X  H  H  1  X  1  L  H  L  V  
0006: X  X  X  X  X  X  X  X  1  G  0  H  H  0  X  1  L  H  H  V  
0007: X  0  0  0  0  0  0  0  0  G  X  L  H  1  X  1  H  H  H  V  
0008: X  X  X  X  X  X  X  X  1  G  X  X  X  1  X  0  L  X  X  V  
0009: X  0  0  0  0  0  0  0  0  G  X  H  L  1  X  1  L  H  H  V  
0010: X  X  X  X  X  X  X  X  1  G  0  H  H  0  X  1  L  H  H  V  
0011: X  0  0  0  0  0  0  0  0  G  X  L  H  1  X  1  H  H  H  V  
0012: X  X  X  X  X  X  X  X  1  G  1  H  H  1  X  0  L  H  H  V  
0013: X  0  0  0  0  0  0  0  0  G  X  H  L  1  X  1  L  H  H  V  
Logic test successful.
```
