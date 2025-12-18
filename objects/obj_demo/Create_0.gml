x = 0;
y = 0;
z = 200;

randomize();
lookat = ddd_random_vector();
lookat[DDD_Z] = -0.25;
ddd_vec3_normalize(lookat, lookat);

mouse_was_locked = false;

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();
format = vertex_format_end();

meshes = [];

var filename = file_find_first("models/*.vbuff", 0);
while (filename != "") {
    var b = buffer_load($"models/{filename}");
    var vb = vertex_create_buffer_from_buffer(b, format);
    vertex_freeze(vb);
    buffer_delete(b);
    array_push(meshes, vb);
    show_debug_message(filename);
    filename = file_find_next();
}
file_find_close();

var add_point = function(vb, position, normal, texcoord, color, alpha) {
    vertex_position_3d(vb, position[DDD_X], position[DDD_Y], position[DDD_Z]);
    vertex_normal(vb, normal[DDD_X], normal[DDD_Y], normal[DDD_Z]);
    vertex_texcoord(vb, texcoord[DDD_X], texcoord[DDD_Y]);
    vertex_colour(vb, color, alpha);
};

the_floor = vertex_create_buffer();
vertex_begin(the_floor, format);
add_point(the_floor, ddd_vec3(-500, -500, 0), ddd_vec3(0, 0, 1), ddd_vec2(0, 0), #66aaff, 1);
add_point(the_floor, ddd_vec3( 500, -500, 0), ddd_vec3(0, 0, 1), ddd_vec2(0, 0), #66aaff, 1);
add_point(the_floor, ddd_vec3( 500,  500, 0), ddd_vec3(0, 0, 1), ddd_vec2(0, 0), #66aaff, 1);

add_point(the_floor, ddd_vec3( 500,  500, 0), ddd_vec3(0, 0, 1), ddd_vec2(0, 0), #66aaff, 1);
add_point(the_floor, ddd_vec3(-500,  500, 0), ddd_vec3(0, 0, 1), ddd_vec2(0, 0), #66aaff, 1);
add_point(the_floor, ddd_vec3(-500, -500, 0), ddd_vec3(0, 0, 1), ddd_vec2(0, 0), #66aaff, 1);
vertex_end(the_floor);
vertex_freeze(the_floor);