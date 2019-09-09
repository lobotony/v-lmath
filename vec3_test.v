import lmath

pub fn test_vec3_equal() {
    assert lmath.vec3{1.0, 2.0, 3.0}.equals(lmath.vec3{1.0, 2.0, 3.0})
    assert !(lmath.vec3{3.0, 2.0, 1.0}.equals(lmath.vec3{1.0, 2.0, 3.0}))
}

pub fn test_vec3_scale() {
    v0 := lmath.vec3{0.0, 1.0, 2.0}
    v1 := v0.scale(2.0)

    assert v1.x == 0.0 && v1.y == 2.0 && v1.z == 4.0
}
