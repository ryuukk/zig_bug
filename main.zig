pub const c = @cImport({
    @cDefine("NK_IMPLEMENTATION", "");
    @cDefine("NK_INCLUDE_FIXED_TYPES", "");
    @cDefine("NK_INCLUDE_STANDARD_IO", "");
    @cDefine("NK_INCLUDE_STANDARD_VARARGS", "");
    @cDefine("NK_INCLUDE_DEFAULT_ALLOCATOR", "");
    @cDefine("NK_INCLUDE_VERTEX_BUFFER_OUTPUT", "");
    @cDefine("NK_INCLUDE_FONT_BAKING", "");
    @cDefine("NK_INCLUDE_DEFAULT_FONT", "");
    @cDefine("NK_IMPLEMENTATION", "");
    @cDefine("NK_KEYSTATE_BASED_INPUT", "");

    @cInclude("nuklear.h");
});

pub fn main() !void {
    var nkCtx: c.nk_context = undefined;
    _ = c.nk_init(&nkCtx, null, null);
}
