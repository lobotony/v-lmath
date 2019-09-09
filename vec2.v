module lmath

struct vec2 {
    pub mut:
    x f32
    y f32
}

pub fn (self vec2) equals(other vec2) bool {
    return equalsf(self.x, other.x) && 
           equalsf(self.y, other.y)
}

pub fn (self vec2) scale(s f32) vec2 {
    return vec2{self.x*s, self.y*s}
}

pub fn (self vec2) plus(other vec2) vec2 {
    return vec2{self.x+other.x, self.y+other.y}
}

pub fn (self vec2) minus(other vec2) vec2 {
    return vec2{self.x-other.x, self.y-other.y}
}

pub fn (self vec2) square_mag() f32 {
    return self.x*self.x+self.y*self.y
}

pub fn (self vec2) mag() f32 {
    return C.sqrtf(self.square_mag())
}

pub fn (self vec2) normalize() vec2 {
    return self.scale(1.0/self.mag())
}

pub fn (self vec2) distance_to(other vec2) f32 {
    return (other.minus(self)).mag()
}

pub fn (self vec2) dot(other vec2) f32 {
    return self.x*other.x + self.y*other.y
} 
