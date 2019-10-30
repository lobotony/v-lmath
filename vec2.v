module lmath

pub struct Vec2 {
    pub mut:
    x f32
    y f32
}

pub fn (self Vec2) equals(other Vec2) bool {
    return equalsf(self.x, other.x) && 
           equalsf(self.y, other.y)
}

pub fn (self Vec2) scale(s f32) Vec2 {
    return Vec2{self.x*s, self.y*s}
}

pub fn (self Vec2) plus(other Vec2) Vec2 {
    return Vec2{self.x+other.x, self.y+other.y}
}

pub fn (self Vec2) minus(other Vec2) Vec2 {
    return Vec2{self.x-other.x, self.y-other.y}
}

pub fn (self Vec2) square_mag() f32 {
    return self.x*self.x+self.y*self.y
}

pub fn (self Vec2) mag() f32 {
    return C.sqrtf(self.square_mag())
}

pub fn (self Vec2) normalize() Vec2 {
    return self.scale(1.0/self.mag())
}

pub fn (self Vec2) distance_to(other Vec2) f32 {
    return (other.minus(self)).mag()
}

pub fn (self Vec2) dot(other Vec2) f32 {
    return self.x*other.x + self.y*other.y
} 
