import lmath

pub fn test_mat44_equals() {
    m0 := lmath.mat44_identity()
    m1 := lmath.mat44_zero()

    assert m0.equals(m0)
    assert m1.equals(m1)
    assert !m0.equals(m1)
    assert !m1.equals(m0)
}

pub fn test_mat44_vec3_identity_transform() {
    v := lmath.vec3{1.0, 2.0, 3.0}
    m := lmath.mat44_identity()
    r := m.transform_v3(v)

    assert r.equals(v)
}

pub fn test_mat44_vec4_identity_transform() {
    v := lmath.vec4{1.0, 2.0, 3.0, 4.0}
    m := lmath.mat44_identity()
    r := m.transform(v)

    assert r.equals(v)
}