module lmath

struct rect {
    x f32
    y f32
    w f32
    h f32
}

pub fn (self rect) contains(x f32, y f32) bool {
    return (x >= self.x) && (x < (self.x+self.w)) && (y >= self.y) && (y < (self.y+self.h))
}
