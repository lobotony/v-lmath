import lmath

pub fn test_vec2_equal() {
    assert lmath.Vec2{1.0, 2.0}.equals(lmath.Vec2{1.0, 2.0})
    assert !(lmath.Vec2{2.0, 1.0}.equals(lmath.Vec2{1.0, 2.0}))
}

pub fn test_vec2_scale() {
    v0 := lmath.Vec2{1.0, 2.0}
    v1 := v0.scale(2.0)

    assert v1.x == 2.0 && v1.y == 4.0
}

pub fn test_vec2_plus() {
    v0 := lmath.Vec2{1.0,2.0}
    v1 := lmath.Vec2{3.0,4.0}
    r := v0.plus(v1)
    assert r.x == 4.0 && r.y == 6.0
}

pub fn test_vec2_minus() {
    v0 := lmath.Vec2{3.0,4.0}
    v1 := lmath.Vec2{1.0,5.0}
    r := v0.minus(v1)
    assert r.x == 2.0 && r.y == -1.0
}

pub fn test_vec2_square_mag() {
    v := lmath.Vec2{2.0, 3.0}
    assert v.square_mag() == 13.0
}

pub fn test_vec2_mag() {
    v := lmath.Vec2{2.0, 3.0}
    assert v.mag() == C.sqrtf(13.0)
}

pub fn test_vec2_normalize() {
    v := lmath.Vec2{3.0, 6.0}
    nv := v.normalize()
    nmag := nv.mag()

    assert lmath.equalsf(nmag, 1.0)
}

pub fn test_vec2_distance() {
    v0 := lmath.Vec2{1.0, 1.0}
    v1 := lmath.Vec2{3.0, 3.0}
    d0 := v0.distance_to(v1)
    d1 := v1.distance_to(v0)
    assert d0 == d1
    assert lmath.equalsf(d0, C.sqrtf(8.0))
}

pub fn test_vec2_dot() {
    v0 := lmath.Vec2{1.0, 2.0}
    v1 := lmath.Vec2{3.0, 4.0}
    d := v0.dot(v1)
    lmath.equalsf(d, 11.0)
}
