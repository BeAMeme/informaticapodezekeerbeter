
draw_set_font(mooifont);
draw_set_color(c_white);
draw_set_alpha(0.8);
var bar_width = sprite_get_width(oBigboy.sprite_index);
draw_rectangle(oBigboy.x - bar_width/2, oBigboy.y + -24, oBigboy.x + bar_width/2, oBigboy.y + -28, true);
draw_set_color(c_lime);
draw_rectangle(oBigboy.x - bar_width/2 + 1, oBigboy.y - 25, oBigboy.x - bar_width/2 + 1 + (bar_width-2) * (oBigboy.current_health / oBigboy.max_health), oBigboy.y - 27, false);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(oBigboy.x, oBigboy.y - 48, "Big Boss");

