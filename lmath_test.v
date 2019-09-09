import lmath

pub fn test_rect_contains() {
    r := lmath.rect{0.0, 0.0, 10.0, 10.0}
    assert r.contains(0.0, 0.0)
    assert r.contains(3.0, 5.0)
    assert !r.contains(10.0, 10.0)
}

pub fn test_npot() {
    assert lmath.next_power_of_two(u32(7)) == u32(8)
}

pub fn test_clamp() {
    assert lmath.clamp(1.3, 0.0, 1.0) == 1.0
    assert lmath.clamp01(1.3) == 1.0
}

pub fn test_mat44_zero() {
    m := lmath.mat44_zero() 
    for i := 0; i<16; i++ {
        assert m.data[i] == 0.0
    }
}

