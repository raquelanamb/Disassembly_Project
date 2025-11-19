#!/usr/bin/env bash
set -e

mkdir -p build/x86 build/arm build/mips build/riscv

FILES=(
    "arithmetic/arithmetic"
    "functions/functions"
    "loops/loops"
    "pointers/pointers"
    "structs/structs"
)

echo "=== Building object files for all architectures ==="

for f in "${FILES[@]}"; do
    name=$(basename "$f")
    src="$f.c"

    echo "---- Compiling $src ----"

    gcc -g -O0 -c "$src" -o "build/x86/$name.o"
    arm-linux-gnueabi-gcc -g -O0 -static -c "$src" -o "build/arm/$name.o"
    mips-linux-gnu-gcc   -g -O0 -static -c "$src" -o "build/mips/$name.o"
    riscv64-linux-gnu-gcc -g -O0 -static -c "$src" -o "build/riscv/$name.o"
done

echo "=== All object files created successfully ==="
