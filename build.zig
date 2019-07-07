const Builder = @import("std").build.Builder;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("zig-miniblink", "src/main.zig");
    exe.setBuildMode(mode);

    exe.setTarget(builtin.Arch{.thumb = builtin.Arch.Arm32.v7em},
    builtin.Os.freestanding, builtin.Abi.musleabihf);

    exe.setLinkerScriptPath("stm32f4-discovery.ld");
    exe.addCSourceFile("src/blink.c", [_][]const u8{"-O3", "-flto"});
///    exe.addCSourceFile("src/blink.c", [_][]const u8{"-O3"});
    exe.addIncludeDir("src");
    exe.addIncludeDir("libopencm3/include");
    exe.addLibPath("libopencm3/lib");
    exe.linkSystemLibrary("opencm3_stm32f4");
    exe.setOutputDir(".");

    const run_cmd = exe.run();

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
