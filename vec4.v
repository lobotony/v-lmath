module lmath

struct Vec4 {
    pub mut:
    x f32
    y f32
    z f32
    w f32
}

pub fn (self Vec4) equals(other Vec4) bool {
    return equalsf(self.x, other.x) && 
           equalsf(self.y, other.y) &&
           equalsf(self.z, other.z) &&
           equalsf(self.w, other.w)
}

pub fn (self Vec4) xyz() Vec3 {
    return Vec3{self.x, self.y, self.z}
}

pub fn (self Vec4) scale(s f32) Vec4 {
    return Vec4{self.x*s, self.y*s, self.z*s, self.w*s}
}

pub fn (self Vec4) plus(other Vec4) Vec4 {
    return Vec4{self.x+other.x, self.y+other.y, self.z+other.z, self.w+other.w}
}

pub fn (self Vec4) minus(other Vec4) Vec4 {
    return Vec4{self.x-other.x, self.y-other.y, self.z-other.z, self.w-other.w}
}

pub fn (self Vec4) square_mag() f32 {
    return self.x*self.x + self.y*self.y + self.z*self.z + self.w*self.w
}

pub fn (self Vec4) mag() f32 {
    return C.sqrtf(self.square_mag())
}

pub fn (self Vec4) normalize() Vec4 {
    return self.scale(1.0/self.mag())
}

pub fn (self Vec4) distance_to(other Vec4) f32 {
    return (other.minus(self)).mag()
}

pub fn (self Vec4) dot(other Vec4) f32 {
    return self.x*other.x + self.y*other.y + self.z*other.z + self.w*other.w
} 
