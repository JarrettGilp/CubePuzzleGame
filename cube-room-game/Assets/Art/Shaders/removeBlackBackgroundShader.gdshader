shader_type canvas_item;
void fragment() {
    vec4 c = texture(TEXTURE, UV);
    if (c.r < 0.05 && c.g < 0.05 && c.b < 0.05) {
        c.a = 0.0;
    }
    COLOR = c;
}