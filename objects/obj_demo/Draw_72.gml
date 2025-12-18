var view_mat = ddd_matrix_build_lookat(x, y, z, x + lookat[DDD_X], y + lookat[DDD_Y], z + lookat[DDD_Z], 0, 0, 1);
var proj_mat = ddd_matrix_build_projection_perspective_fov(60, window_get_width() / window_get_height(), 1, 1000);
matrix_set(matrix_view, view_mat);
matrix_set(matrix_projection, proj_mat);