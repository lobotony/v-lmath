module lmath

pub fn next_power_of_two(val u32) u32 {
    mut result := u32(1)

    for result < val {
        result <<= u32(1)
    }

    return result
}

pub fn clamp(val f32, lower f32, upper f32) f32 {
    return C.fminf(C.fmaxf(lower, val), upper)
}

pub fn clamp01(val f32) f32 {
    return clamp(val, 0.0, 1.0)
}

// compate two float numbers, taking 32bit inaccuracies into account by allowing for deviations up to FLT_EPSILON
pub fn equalsf(v0 f32, v1 f32) bool {
    return C.fabsf(v0 - v1) < C.FLT_EPSILON
}
