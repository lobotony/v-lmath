module lmath

#include <math.h>

fn C.fminf(f32, f32) f32
fn C.fmaxf(f32, f32) f32
fn C.sqrtf(f32) f32
fn C.cosf(f32) f32
fn C.sinf(f32) f32
fn C.fabsf(f32) f32 
fn C.floorf(f32) f32
fn C.tanf(f32) f32

pub fn fminf(val0 f32, val1 f32) f32 {
    return C.fminf(val0, val1)
}

pub fn floorf(val f32) f32 {
    return C.floorf(val)
}

