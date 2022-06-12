const std = @import("std");

const Builder = std.build.Builder;
const Target = std.zig.CrossTarget;
const Pkg = std.build.Pkg;

const Kind = enum { GAME, SERVER, MASTER };

pub fn build(b: *Builder) !void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("bug", "main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);
    exe.setOutputDir("bin/");

    exe.linkLibC();
    exe.linkSystemLibrary("c");

    exe.addCSourceFile("c/nuklear/nuklear.c", &.{"-std=c99"});
    exe.addIncludeDir("c/nuklear/");

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());

    const run_step = b.step("bug", b.fmt("run {s}", .{"bug"}));
    run_step.dependOn(&run_cmd.step);
}
