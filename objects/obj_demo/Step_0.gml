var mspd = 1
var xspeed = 0;
var yspeed = 0;
var zspeed = 0;

var pitch = 0;

if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
    xspeed += dcos(dir) * mspd;
    yspeed -= dsin(dir) * mspd;
    zspeed -= dsin(pitch) * mspd;
}

if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
    xspeed -= dcos(dir) * mspd;
    yspeed += dsin(dir) * mspd;
    zspeed += dsin(pitch) * mspd;
}

if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    xspeed += dsin(dir) * mspd;
    yspeed += dcos(dir) * mspd;
}

if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    xspeed -= dsin(dir) * mspd;
    yspeed -= dcos(dir) * mspd;
}

if (mouse_check_button_pressed(mb_middle)) {
    mouse_was_locked = window_mouse_get_locked();
    window_mouse_set_locked(true);
} else if (mouse_check_button(mb_middle)) {
    var dx = window_mouse_get_delta_x() / 10;
    var dy = window_mouse_get_delta_y() / 10;
    ddd_vec3_rotate(lookat, ddd_vec3(0, 0, 1), dx, lookat);
} else {
    window_mouse_set_locked(mouse_was_locked);
}
x += xspeed;
y += yspeed;
z += zspeed;

repeat (1000) {
    ddd_vec3_rotate(lookat, ddd_vec3(0, 0, 1), 0);
}