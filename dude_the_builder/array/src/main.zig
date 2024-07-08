const std = @import("std");

pub fn main() !void {
    // Explicit type and length
    const a1: [5]u8 = [5]u8{ 0, 1, 2, 3, 4 };
    std.debug.print("a1: {any}, a1.len: {}\n", .{ a1, a1.len });

    // Infered type and length
    const a2 = [_]u8{ 0, 1, 2, 3, 4 };
    std.debug.print("a2: {any}, a2.len: {}\n", .{ a2, a2.len });

    // ** repets an array
    const a3 = a2 ** 2;
    std.debug.print("a3: {any}, a3.len: {}\n", .{ a3, a3.len });
    // ... it can initialize with a repited value
    const a4 = [_]u8{0} ** 5;
    std.debug.print("a4: {any}, a4.len: {}\n", .{ a4, a4.len });

    // The array lenght has to be comptime know
    // var x: u8 = 5;
    // const a5: [x]u8 = [_]u8{0} ** x;
    // std.debug.print("a5: {any}, a5.len: {}\n", .{ a5, a5.len });

    // You can use undefined for the array and then use later
    var a6: [6]u8 = undefined;
    a6[0] = 1;
    a6[1] = 2;
    std.debug.print("a6: {any}, a6.len: {}\n", .{ a6, a6.len });

    // Multu-dimensional arrays
    var a7: [2][2]u8 = [_][2]u8{
        .{ 1, 2 },
        .{ 3, 4 },
    };
    std.debug.print("a7: {any}, a7.len: {}\n", .{ a7, a7.len });
    std.debug.print("a7[1][0] == {}\n", .{a7[1][0]});

    // Sentinel terminated arrays use [N:V]T syntax where N is lenght
    // and V is the sentinel value of type T.
    const a8: [2:0]u8 = .{ 1, 2 };
    std.debug.print("a8: {any}, a8.len {}\n", .{ a8, a8.len });

    // In normal arrays you can't access the index == len.
    // std.debug.print("a7[a7.len][0] == {}\n", .{a7[a7.len][0]});
    // In a sentinel terminated array, you can, and it's the sentinel
    std.debug.print("a8[a8.len] == {}", .{a8[a8.len]});

    // ++ concatenates arrays
    const a9 = a1 ++ a2;
    std.debug.print("a9: {any}, a9.len: {}\n", .{ a9, a9.len });

    // With ** you can call functions to initialate an array
    const a10 = [_]u8{getSquare(3)} ** 3;
    std.debug.print("a10: {any}, a10.len: {}\n", .{ a10, a10.len });

    // empty arrays
    _ = [0]u8{};
    _ = [_]u8{};
}

fn getSquare(x: u8) u8 {
    return x *| x;
}
