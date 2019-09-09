import lmath

pub fn test_vec4_equal() {
    assert lmath.vec4{1.0, 2.0, 3.0, 4.0}.equals(lmath.vec4{1.0, 2.0, 3.0, 4.0})
    assert !(lmath.vec4{4.0, 3.0, 2.0, 1.0}.equals(lmath.vec4{1.0, 2.0, 3.0, 4.0}))
}

