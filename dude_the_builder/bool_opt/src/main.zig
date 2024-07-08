const std = @import("std");

pub fn main() !void {
    // A bool can only be true or false
    const t: bool = true;
    const f: bool = false;
    std.debug.print("t: {}, f: {}\n", .{ t, f });

    // You can convert a bool to an integer (0 or 1 only)
    std.debug.print("t: {}, f: {}\n", .{ @intFromBool(t), @intFromBool(f) });

    // Only optionals can be null
    var maybe_byte: ?u8 = null;
    std.debug.print("maybe_byte: {?}\n", .{maybe_byte});
    maybe_byte = 42;
    std.debug.print("maybe_byte: {?}\n", .{maybe_byte});

    // Use the '?' to assert the optional is not null and extract its payload.
    // This is an assertion to check in the code
    var the_byte = maybe_byte.?;

    // `orelse` will extracct the payload or default to the provided value if null.
    the_byte = maybe_byte orelse 13;

    // you can control execution flow with if, bool, and optionals.
    if (f) {
        std.debug.print("It's {}!\n", .{t});
    } else if (f) {
        std.debug.print("What?\n", .{f});
    } else {
        std.debug.print("None of the abvove are true.\n", .{});
    }
    // You can capture the paylode of an optional if it's not null.
    if (maybe_byte) |b| {
        std.debug.print("b is {}\n", .{b});
    } else {
        std.debug.print("It's null.\n", .{});
    }

    // You can ignore the payload with `_`.
    if (maybe_byte) |_| {
        std.debug.print("It's not null.\n", .{});
    }

    // Only optionals can be compared to null.
    if (maybe_byte == null) {
        std.debug.print("It's null.\n", .{});
    }

    // You can write a simple `if` as a one liner.
    if (t) std.debug.print("It's {}!\n", .{t});

    // You canalso unse an `if` as an expression.
    // Zig's version of the ternary operatior?:.
    the_byte = if (maybe_byte) |b| b else 0;
    // `orelse` is a convinient shortcut for the above line.
    the_byte = maybe_byte orelse 0;

    // When using `if` as an expression, the braces are not allowed
    the_byte = if (maybe_byte != null and maybe_byte.? == 42)
        42 * 2
    else
        0;

    std.debug.print("the_byte: {}\n", .{the_byte});
}
