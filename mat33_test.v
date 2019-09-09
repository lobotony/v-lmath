import lmath

pub fn test_mat33_equals() {
    m0 := lmath.mat33_identity()
    m00 := lmath.mat33_identity()
    m1 := lmath.mat33_zero()
    m11 := lmath.mat33_zero()

    assert m0.equals(m00)
    assert m1.equals(m11)
    assert !m0.equals(m1)
    assert !m1.equals(m0)
}

pub fn test_mat33_vec3_identity_transform() {
    v := lmath.vec3{1.0, 2.0, 3.0}
    m := lmath.mat33_identity()
    r := m.transform(v)

    assert r.equals(v)
}