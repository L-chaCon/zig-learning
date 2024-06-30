const std = @import("std");

// Constant variables are in snake_case

// Golobal constant This are unmutable
const global_const: u8 = 42;

// Global var this are mutables
var global_var: u8 = 0;

// Function are in camelCase
fn printInfo(name: []const u8, x: anytype) void {
    std.debug.print("{s:>10} {any:^10}\t{}\n", .{ name, x, @TypeOf(x) });
}

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("{s:>10} {s:^10}\t{s}\n", .{ "name", "value", "type" });
    std.debug.print("{s:>10} {s:^10}\t{s}\n", .{ "-----", "-----", "-----" });

    // `const` define an unmutable value
    const a_const = 1;
    // a_const += 1;
    printInfo("a_const", a_const);

    // `var` defines a mutable variable
    var a_var: u8 = 2;
    a_var += 1;
    printInfo("a_var", a_var);

    // var must have a type or be comptime
    // var b_var = 3;
    // comptime var b_var = 3;
    var b_var: u8 = 3;
    printInfo("b_var", b_var);

    // `var` and `const` must have a init value
    // const b_const;
    // var c_var: u8;

    // you can use `undefined` to init a variable whose value is to be
    // determinated later in the program
    var d_var: u8 = undefined;
    printInfo("d_var(undefined)", d_var);
    d_var = 3;
    printInfo("d_var", d_var);

    // You can't define a variable and not use it. This is an error
    var e_var: u8 = 4;
    // As a workaround, you can use the underscore special name to
    // ignore something
    _ = e_var;

    // Integers:
    // Unsigned: u8, u16, u32, u64, u128, usize
    // Signed: i8, i16, i32, i64, i128, isize
    // Literals: decimal, binary, hex, and octal.
    _ = 1_000_000; // decimal
    _ = 0x10ff_ffff; // hex
    _ = 0o777; // octal
    _ = 0b1111_0101_0111; // binary
    // You can have arbitrary size
    var f_var: u1 = 0;
    f_var = 1;
    // f_var = 2;

    // `comptime_init` is the type of integer literals
    const c_const = 42;
    printInfo("c_const", c_const);

    // Floating Point: f16, f32, f64, f80, f128
    // Literals: can be decimal or hex
    _ = 123.0E+77; // with exponents
    _ = 123.0; // without exponents
    _ = 123.0e+77; // E or e can be used

    _ = 0x103.70; // hex floting point
    _ = 0x103.70p-5; // p or P for hex exponents
    _ = 0x103.70P-5;

    // Optional underscores
    _ = 299_792_456.000_000;
    _ = 0.000_000_001;
    _ = 0x1234_5678.9ABC_CDEFp-10;

    // Infinity and NaN
    _ = std.math.inf(f64); // Positive Infinity
    _ = -std.math.inf(f64); // Negative Infinity
    _ = std.math.nan(f64);

    // comptime float
    const d_const = 3.14;
    printInfo("d_const", d_const);
}
