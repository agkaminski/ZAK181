# CPLD - VGA timing generator and position counter

Target: XC95108, any speed, **not** XL version

## Pinout

| Pin | Type     | Name      |
|-----|----------|-----------|
| 1   | I/O      | vdata<3>  |
| 2   | I/O      | vdata<4>  |
| 3   | I/O      | vdata<5>  |
| 4   | I/O      | vdata<6>  |
| 5   | I/O      | vdata<7>  |
| 6   | I/O      | vaddr<10> |
| 7   | I/O      | vrd_n     |
| 8   | GND      | GND       |
| 9   | I/O/GCK1 | pclk      |
| 10  | I/O/GCK2 | TIE       |
| 11  | I/O      | vaddr<11> |
| 12  | I/O/GCK3 | shload_n  |
| 13  | I/O      | vaddr<9>  |
| 14  | I/O      | vaddr<8>  |
| 15  | I/O      | vaddr<13> |
| 16  | GND      | GND       |
| 17  | I/O      | vwr_n     |
| 18  | I/O      | vaddr<12> |
| 19  | I/O      | vaddr<7>  |
| 20  | I/O      | vaddr<6>  |
| 21  | I/O      | vaddr<5>  |
| 22  | VCCIO    | VCC       |
| 23  | I/O      | vaddr<4>  |
| 24  | I/O      | vaddr<3>  |
| 25  | I/O      | vaddr<2>  |
| 26  | I/O      | vaddr<1>  |
| 27  | GND      | GND       |
| 28  | TDI      | TDI       |
| 29  | TMS      | TMS       |
| 30  | TCK      | TCK       |
| 31  | I/O      | vaddr<0>  |
| 32  | I/O      | vdata<0>  |
| 33  | I/O      | vdata<2>  |
| 34  | I/O      | vdata<1>  |
| 35  | I/O      | scroll<0> |
| 36  | I/O      | scroll<1> |
| 37  | I/O      | scroll<2> |
| 38  | VCCINT   | VCC       |
| 39  | I/O      | scroll<3> |
| 40  | I/O      | scroll<4> |
| 41  | I/O      | scroll<5> |
| 42  | GND      | GND       |
| 43  | I/O      | irqack_n  |
| 44  | I/O      | irq_n     |
| 45  | I/O      | data<3>   |
| 46  | I/O      | data<2>   |
| 47  | I/O      | data<4>   |
| 48  | I/O      | data<1>   |
| 49  | GND      | GND       |
| 50  | I/O      | data<5>   |
| 51  | I/O      | data<0>   |
| 52  | I/O      | data<6>   |
| 53  | I/O      | data<7>   |
| 54  | I/O      | crow<2>   |
| 55  | I/O      | crow<1>   |
| 56  | I/O      | crow<0>   |
| 57  | I/O      | addr<12>  |
| 58  | I/O      | addr<11>  |
| 59  | TDO      | TDO       |
| 60  | GND      | GND       |
| 61  | I/O      | addr<13>  |
| 62  | I/O      | addr<9>   |
| 63  | I/O      | addr<10>  |
| 64  | VCCIO    | VCC       |
| 65  | I/O      | addr<7>   |
| 66  | I/O      | addr<8>   |
| 67  | I/O      | addr<5>   |
| 68  | I/O      | addr<6>   |
| 69  | I/O      | addr<4>   |
| 70  | I/O      | addr<2>   |
| 71  | I/O      | addr<3>   |
| 72  | I/O      | addr<0>   |
| 73  | VCCINT   | VCC       |
| 74  | I/O/GSR  | rst_n     |
| 75  | I/O      | addr<1>   |
| 76  | I/O/GTS1 | blank     |
| 77  | I/O/GTS2 | rd_n      |
| 78  | VCCINT   | VCC       |
| 79  | I/O      | wr_n      |
| 80  | I/O      | cs_n      |
| 81  | I/O      | hsync_n   |
| 82  | I/O      | vsync_n   |
| 83  | I/O      | pload_n   |
| 84  | I/O      | cload_n   |

## vga.v

Implementation (Verilog).

## vga.dig

Test bench of sorts - uses [Digital](https://github.com/hneemann/Digital), which has a
huge advantage over plain Verilog/VHDL based test bench - it can process generated VGA
data and present it visually. It makes it a perfect tool for this kind of verification.

## vga.ucf

Pinout constraints (ISE 14.7).

## vga.jed

Bitstream ready to upload to the CPLD.
