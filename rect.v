module lmath

struct Rect {
    x f32
    y f32
    w f32
    h f32
}

pub fn (self Rect) contains(x f32, y f32) bool {
    return (x >= self.x) && (x < (self.x+self.w)) && (y >= self.y) && (y < (self.y+self.h))
}
