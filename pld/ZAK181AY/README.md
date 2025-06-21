# ZAK181AY

ZAK181 SBC AY-3-8912 bus decoder PLD (GAL16V8). This chip decodes the memory bus
and generated signals for bizzare AY-3-8912 system bus. Also handles clock generation
(VGA clock 25.175 MHz / 16 = 1.573 MHz) that is suitable for the synthesizer operation
and provides a single inverter for external use.

Chip is designed in GALasm that can be compiled to JEDEC via [Galette](https://github.com/simon-frankau/galette) -
source is in `zak181ay.pld` file. Ready to program JEDEC file is provided in `zak181ay.jed` file.

## Pinout

```
    -------\___/-------
CLK |  1           20 | VCC
    |                 |
 A0 |  2           19 | C0
    |                 |
/CS |  3           18 | C1
    |                 |
/RD |  4           17 | C2
    |                 |
/WR |  5           16 | BC1
    |                 |
 NC |  6           15 | BDIR
    |                 |
 NC |  7           14 | NC
    |                 |
 NC |  8           13 | COUT
    |                 |
  A |  9           12 | /Y
    |                 |
GND | 10           11 | /OE
    -------------------
```

## Verification

GAL can be programmed and verified (test vectors functional test) via TL866 and [minipro](https://gitlab.com/DavidGriffith/minipro).

To program the chip (use appropriate chip designation):

```
$ minipro -p GAL16V8D -w zak181ay.jed
```

Functional tests can be performed by:

```
$ minipro --logicic test.xml -TpZAK181AY
```

Expected output (all test vectors verified ok):

```
      1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20 
0000: 0  X  X  X  X  X  X  X  0  G  0  H  X  X  X  X  X  X  X  V  
0001: 0  X  X  X  X  X  X  X  1  G  0  L  X  X  X  X  X  X  X  V  
0002: 0  0  0  0  0  X  X  X  X  G  0  X  X  X  H  H  X  X  X  V  
0003: 0  0  0  0  1  X  X  X  X  G  0  X  X  X  L  H  X  X  X  V  
0004: 0  0  0  1  0  X  X  X  X  G  0  X  X  X  H  H  X  X  X  V  
0005: 0  0  0  1  1  X  X  X  X  G  0  X  X  X  L  L  X  X  X  V  
0006: 0  0  1  0  0  X  X  X  X  G  0  X  X  X  L  L  X  X  X  V  
0007: 0  0  1  0  1  X  X  X  X  G  0  X  X  X  L  L  X  X  X  V  
0008: 0  0  1  1  0  X  X  X  X  G  0  X  X  X  L  L  X  X  X  V  
0009: 0  0  1  1  1  X  X  X  X  G  0  X  X  X  L  L  X  X  X  V  
0010: 0  1  0  0  0  X  X  X  X  G  0  X  X  X  H  L  X  X  X  V  
0011: 0  1  0  0  1  X  X  X  X  G  0  X  X  X  L  L  X  X  X  V  
0012: 0  1  0  1  0  X  X  X  X  G  0  X  X  X  H  L  X  X  X  V  
0013: 0  1  0  1  1  X  X  X  X  G  0  X  X  X  L  L  X  X  X  V  
0014: 0  1  1  0  0  X  X  X  X  G  0  X  X  X  L  L  X  X  X  V  
0015: 0  1  1  0  1  X  X  X  X  G  0  X  X  X  L  L  X  X  X  V  
0016: 0  1  1  1  0  X  X  X  X  G  0  X  X  X  L  L  X  X  X  V  
0017: 0  1  1  1  1  X  X  X  X  G  0  X  X  X  L  L  X  X  X  V  
0018: 0  X  X  X  X  X  X  X  X  G  0  X  H  X  X  X  H  H  H  V  
0019: C  X  X  X  X  X  X  X  X  G  0  X  L  X  X  X  L  L  H  V  
0020: C  X  X  X  X  X  X  X  X  G  0  X  L  X  X  X  L  H  L  V  
0021: C  X  X  X  X  X  X  X  X  G  0  X  L  X  X  X  L  H  H  V  
0022: C  X  X  X  X  X  X  X  X  G  0  X  L  X  X  X  H  L  L  V  
0023: C  X  X  X  X  X  X  X  X  G  0  X  L  X  X  X  H  L  H  V  
0024: C  X  X  X  X  X  X  X  X  G  0  X  L  X  X  X  H  H  L  V  
0025: C  X  X  X  X  X  X  X  X  G  0  X  L  X  X  X  H  H  H  V  
0026: C  X  X  X  X  X  X  X  X  G  0  X  H  X  X  X  L  L  L  V  
0027: C  X  X  X  X  X  X  X  X  G  0  X  H  X  X  X  L  L  H  V  
0028: C  X  X  X  X  X  X  X  X  G  0  X  H  X  X  X  L  H  L  V  
0029: C  X  X  X  X  X  X  X  X  G  0  X  H  X  X  X  L  H  H  V  
0030: C  X  X  X  X  X  X  X  X  G  0  X  H  X  X  X  H  L  L  V  
0031: C  X  X  X  X  X  X  X  X  G  0  X  H  X  X  X  H  L  H  V  
0032: C  X  X  X  X  X  X  X  X  G  0  X  H  X  X  X  H  H  L  V  
0033: C  X  X  X  X  X  X  X  X  G  0  X  H  X  X  X  H  H  H  V  
Logic test successful.
```
