# Booth's Multiplication Algorithm

## Overview

This project implements **Booth's Algorithm** for signed 32-bit integer multiplication using ARM Assembly.

## Simulator

- **Tested and verified using [ARMSim#]**  
- The 64-bit result is correctly stored in memory (`product`) as expected.

## Input/Output

```assembly
.data
multiplier:   .word 0xffffff55   @ -171 in two's complement
multiplicand: .word 0x55         @ 85
product:      .word 0, 0         @ To store 64-bit result
```
