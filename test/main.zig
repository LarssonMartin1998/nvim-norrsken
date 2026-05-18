const std = @import("std");
const Allocator = std.mem.Allocator;

// ── Enum ──────────────────────────────────────────────────────────────────────

pub const Color = enum(u8) {
    red,
    green,
    blue,

    pub fn isWarm(self: Color) bool {
        return switch (self) {
            .red => true,
            .green, .blue => false,
        };
    }
};

pub const Direction = enum { north, south, east, west };

// ── Struct ────────────────────────────────────────────────────────────────────

pub const Vec2 = struct {
    x: f32,
    y: f32,

    pub fn add(self: Vec2, other: Vec2) Vec2 {
        return .{ .x = self.x + other.x, .y = self.y + other.y };
    }

    pub fn dot(self: Vec2, other: Vec2) f32 {
        return self.x * other.x + self.y * other.y;
    }

    pub fn length(self: Vec2) f32 {
        return @sqrt(self.x * self.x + self.y * self.y);
    }
};

// ── Tagged union ──────────────────────────────────────────────────────────────

pub const Shape = union(enum) {
    circle: f32,
    rect: struct { w: f32, h: f32 },

    pub fn area(self: Shape) f32 {
        return switch (self) {
            .circle => |r| 3.14159265 * r * r,
            .rect => |s| s.w * s.h,
        };
    }
};

// ── Error handling ────────────────────────────────────────────────────────────

pub const ParseError = error{
    InvalidInput,
    Overflow,
};

pub fn parseInt(s: []const u8) ParseError!i64 {
    if (s.len == 0) return error.InvalidInput;
    var result: i64 = 0;
    for (s) |c| {
        if (c < '0' or c > '9') return error.InvalidInput;
        const digit: i64 = @intCast(c - '0');
        result = result * 10 + digit;
    }
    return result;
}

pub fn safeDivide(a: i32, b: i32) !i32 {
    if (b == 0) return error.DivisionByZero;
    return @divTrunc(a, b);
}

// ── Comptime generics ─────────────────────────────────────────────────────────

pub fn Stack(comptime T: type) type {
    return struct {
        items: std.ArrayList(T),

        const Self = @This();

        pub fn init(allocator: Allocator) Self {
            return .{ .items = std.ArrayList(T).init(allocator) };
        }

        pub fn push(self: *Self, item: T) !void {
            try self.items.append(item);
        }

        pub fn pop(self: *Self) ?T {
            if (self.items.items.len == 0) return null;
            return self.items.pop();
        }

        pub fn deinit(self: *Self) void {
            self.items.deinit();
        }
    };
}

pub fn clamp(comptime T: type, value: T, lo: T, hi: T) T {
    if (value < lo) return lo;
    if (value > hi) return hi;
    return value;
}

pub fn maxOf(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}

// ── Control flow ──────────────────────────────────────────────────────────────

pub fn controlFlow(n: i32) void {
    if (n < 0) {
        std.debug.print("negative\n", .{});
    } else if (n == 0) {
        std.debug.print("zero\n", .{});
    } else {
        std.debug.print("positive\n", .{});
    }

    const tag: []const u8 = switch (@mod(n, 3)) {
        0 => "fizz",
        1 => "one",
        2 => "two",
        else => unreachable,
    };
    _ = tag;

    var i: usize = 0;
    while (i < 10) : (i += 1) {
        if (i % 2 == 0) continue;
        if (i > 7) break;
        std.debug.print("{d} ", .{i});
    }

    const data = [_]i32{ 10, 20, 30, 40, 50 };
    for (data, 0..) |item, idx| {
        std.debug.print("[{d}]={d}\n", .{ idx, item });
    }

    const result: i32 = blk: {
        var sum: i32 = 0;
        for (0..20) |k| {
            sum += @intCast(k);
            if (sum > 50) break :blk sum;
        }
        break :blk sum;
    };
    _ = result;
}

// ── defer / errdefer ──────────────────────────────────────────────────────────

pub fn withDefer(allocator: Allocator, input: []const u8) !i64 {
    const buf = try allocator.dupe(u8, input);
    errdefer allocator.free(buf);
    defer allocator.free(buf);
    return parseInt(buf);
}

// ── Optionals ─────────────────────────────────────────────────────────────────

pub fn findFirst(items: []const i32, threshold: i32) ?i32 {
    for (items) |item| {
        if (item > threshold) return item;
    }
    return null;
}

pub fn optionalDemo() void {
    const nums = [_]i32{ 1, 3, 7, 2, 8 };

    const found = findFirst(&nums, 5) orelse -1;
    std.debug.print("found: {d}\n", .{found});

    if (findFirst(&nums, 5)) |v| {
        std.debug.print("unwrapped: {d}\n", .{v});
    }
}

// ── Comptime ──────────────────────────────────────────────────────────────────

pub fn comptimeDemo() void {
    const NativeWord = if (@sizeOf(usize) == 8) u64 else u32;
    const x: NativeWord = 0xDEAD;
    _ = x;

    const lookup = comptime blk: {
        var table: [256]u8 = undefined;
        for (&table, 0..) |*entry, i| {
            entry.* = @intCast(i ^ 0x55);
        }
        break :blk table;
    };
    _ = lookup;
}

// ── Built-in functions ────────────────────────────────────────────────────────

pub fn builtinsDemo() void {
    const x: u32 = 0b1010_1010;
    _ = @popCount(x);
    _ = @clz(x);
    _ = @ctz(x);
    _ = @byteSwap(x);

    const f: f32 = 3.14;
    const n: i32 = @intFromFloat(f);
    _ = n;

    const arr = [_]u8{ 1, 2, 3 };
    _ = @sizeOf(@TypeOf(arr));
    _ = @alignOf(u64);

    const a: u16 = 200;
    const b: u16 = 100;
    const overflow = @addWithOverflow(a, b);
    _ = overflow;
}

// ── Zig 0.16: type-creation builtins (replaces @Type) ────────────────────────

pub fn typeCreationDemo() void {
    const U17 = @Int(.unsigned, 17);
    const val: U17 = 131071;
    _ = val;

    const S3 = @Int(.signed, 3);
    const s: S3 = -3;
    _ = s;
}

// ── Tests ─────────────────────────────────────────────────────────────────────

test "clamp" {
    try std.testing.expectEqual(@as(i32, 5), clamp(i32, 5, 0, 10));
    try std.testing.expectEqual(@as(i32, 0), clamp(i32, -5, 0, 10));
    try std.testing.expectEqual(@as(i32, 10), clamp(i32, 15, 0, 10));
}

test "parseInt" {
    try std.testing.expectEqual(@as(i64, 42), try parseInt("42"));
    try std.testing.expectEqual(@as(i64, 0), try parseInt("0"));
    try std.testing.expectError(ParseError.InvalidInput, parseInt(""));
    try std.testing.expectError(ParseError.InvalidInput, parseInt("xyz"));
}

test "Vec2.add" {
    const a = Vec2{ .x = 1.0, .y = 2.0 };
    const b = Vec2{ .x = 3.0, .y = 4.0 };
    const c = a.add(b);
    try std.testing.expectEqual(@as(f32, 4.0), c.x);
    try std.testing.expectEqual(@as(f32, 6.0), c.y);
}

test "Shape.area rect" {
    const r = Shape{ .rect = .{ .w = 3.0, .h = 4.0 } };
    try std.testing.expectEqual(@as(f32, 12.0), r.area());
}

test "Stack push/pop" {
    var stack = Stack(i32).init(std.testing.allocator);
    defer stack.deinit();
    try stack.push(1);
    try stack.push(2);
    try stack.push(3);
    try std.testing.expectEqual(@as(?i32, 3), stack.pop());
    try std.testing.expectEqual(@as(?i32, 2), stack.pop());
    try std.testing.expectEqual(@as(?i32, 1), stack.pop());
    try std.testing.expect(stack.pop() == null);
}

test "Color.isWarm" {
    try std.testing.expect(Color.red.isWarm());
    try std.testing.expect(!Color.blue.isWarm());
}

// ── main ──────────────────────────────────────────────────────────────────────

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    controlFlow(5);
    optionalDemo();
    comptimeDemo();
    builtinsDemo();
    typeCreationDemo();

    var stack = Stack(i32).init(allocator);
    defer stack.deinit();
    try stack.push(10);
    try stack.push(20);
    try stack.push(30);
    while (stack.pop()) |v| {
        std.debug.print("{d}\n", .{v});
    }

    const parsed = withDefer(allocator, "123") catch |err| {
        std.debug.print("error: {}\n", .{err});
        return;
    };
    std.debug.print("parsed: {d}\n", .{parsed});

    const v = Vec2{ .x = 3.0, .y = 4.0 };
    std.debug.print("length: {d:.3}\n", .{v.length()});

    const shape = Shape{ .circle = 5.0 };
    std.debug.print("area: {d:.3}\n", .{shape.area()});

    std.debug.print("max: {d}\n", .{maxOf(i32, 3, 7)});
    std.debug.print("warm: {}\n", .{Color.red.isWarm()});

    const result = safeDivide(10, 0) catch |err| blk: {
        std.debug.print("caught: {}\n", .{err});
        break :blk 0;
    };
    _ = result;
}
