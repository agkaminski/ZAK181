# ZAK181 computer

Work in progress.

## Hardware features

- Z180 CPU,
- 1 MB of static RAM,
- 16 KB bootloader ROM,
- Comact Flash slot in True IDE mode,
- 16 bit GPIO user port,
- 2 UARTs: USB-C and RS232,
- AY-3-8912 sound,
- 80x60 8-color text mode VGA output,
- custom Cherry-MX mechanical keyboard,
- USB-C powered.

## Firmare

ZAKOS code repository is located [here](https://github.com/agkaminski/ZAKOS).

## Memory map

| Start   | End     | Description                              |
|---------|---------|------------------------------------------|
| 0x00000 | 0x03FFF | ROM, disabled after boot, after that RAM |
| 0x04000 | 0xFDFFF | RAM                                      |
| 0xFC000 | 0xFFFFF | Memory mapped I/O, VGA VRAM              |

## I/O map

8-bit I/O is used.

| Start | End  | Description            |
|-------|------|------------------------|
| 0x00  | 0x3F | Z180 internal I/O      |
| 0x40  | 0x5F | VBLANK IRQ acknowledge |
| 0x60  | 0x7F | ROM disable control    |
| 0x80  | 0x9F | Keyboard               |
| 0xA0  | 0xBF | Z80 PIO (user port)    |
| 0xC0  | 0xDF | AY-3-8912              |
| 0xE0  | 0xFF | Compact Flash          |

## Repository structure

### datasheet

Collection of useful datasheets, might be removed in the future.

### keyboard2

Subrepository that contains a hardware project of a mechanical keyboard for the
computer.

### kicad

KiCAD project of the computer's PCB.

### pld

Gateware of PLDs:

- [vga](pld/vga/README.md),
- [ZAK181MD](pld/ZAK181MD/README.md),
- [ZAK181AY](pld/ZAK181AY/README.md).

### schematic.pdf

[Schematic](schematic.pdf) of the computer in a friendly .pdf form.

### 3dprint

3D models designed for FDM 3D priting.

## License

[Attribution-NonCommercial 4.0](LICENSE)
