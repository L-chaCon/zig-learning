const std = @import("std");

pub fn main() !void {
    const zero: u8 = 0;
    const one: u8 = 1;
    const two: u8 = 2;
    const two_fifty: u8 = 250;

    // Add, sub, mul, div, mod.
    var result = zero + two - one * two / one % 2;
    std.debug.print("result {}\n", .{result});

    // Add, sub, mul can be overflow
    result = two_fifty + two;

    // result = two_fifty * two; // Overflow
    result = two_fifty *% two; // Wrapping
    std.debug.print("*% result {}\n", .{result});
    result = two_fifty *| two; // Saturating
    std.debug.print("*| result {}\n", .{result});

    // result = zero - one; // Overflow
    result = zero -% one; // Wrapping
    std.debug.print("-| result {}\n", .{result});
    result = zero -| one; // Saturating

    const neg_one_twenty_eight: i8 = -128;
    // std.debug.print("-%-128 i8 result {}\n", .{-neg_one_twenty_eight}); // Overflow
    std.debug.print("-% -128 i8 result {}\n", .{-%neg_one_twenty_eight});

    // Shifts
    _ = 1 << 2;
    _ = 1 <<| 2;
    _ = 32 >> 1;

    // Bit Ops
    _ = 32 | 2; // or
    _ = 32 & 1; // and
    _ = 32 ^ 0; // xorg
    var one_bit: u8 = 0b0000_0001;
    _ = ~one_bit; // not

    // Comparason
    _ = 3 < 9;
    _ = 3 <= 9;
    _ = 9 > 3;
    _ = 9 >= 3;
    _ = 3 == 3;
    _ = 3 != 3;

    // types coerce when it's safe
    const byte: u8 = 200;
    const word: u16 = 999;
    var dword: u32 = byte + word;
    std.debug.print("dword {}\n", .{dword});
    // Otherwise you have to cast.
    const word_2: u16 = @intCast(dword);
    std.debug.print("word_2 {}\n", .{word_2});

    // Conversion
    var a_float: f32 = 3.1415;
    const an_int: i32 = @intFromFloat(a_float);
    std.debug.print("an_int {}\n", .{an_int});
    a_float = @floatFromInt(an_int);
    std.debug.print("a_float {}\n", .{a_float});

    // Numeric op builtins
    // @addWithOverflow, @mulWithOverflow, @mod, @rem, @fabs, @sqrt, @min, @max, etc...

    // std.math Numeric ops too
    // std.math.add, std.math.sub, std.math.divExact, etc...
}
