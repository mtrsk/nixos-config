{ json }:
let
  to_color = x: builtins.replaceStrings ["#"] [""] x;
  picker = x: builtins.getAttr x json.colors;
in
''
conky.config = {
    -- Colors
    color0 = "${to_color (picker "color0")}",
    color1 = "${to_color (picker "color1")}",
    color2 = "${to_color (picker "color2")}",
    color3 = "${to_color (picker "color3")}",
    color4 = "${to_color (picker "color4")}",
    color5 = "${to_color (picker "color5")}",
    color6 = "${to_color (picker "color6")}",
    -- ====================
    alignment = 'top_right',
    background = true,
    cpu_avg_samples = 4,
    default_color = color0,
    default_outline_color = color1,
    default_shade_color = color2,
    draw_borders = false,
    double_buffer = true,
    font = 'Hack:size=9',
    draw_shades = true,
    gap_x = 30,
    gap_y = 50,
    no_buffers = true,
    own_window = true,
    own_window_type = 'override',
    own_window_transparent = false,
    own_window_argb_visual = true,
    own_window_argb_value = 220,
    own_window_colour = color5,
    update_interval = 2.0,
    use_xft = true,
    minimum_width = 350,
}
'' + (builtins.readFile ./conky.text)
