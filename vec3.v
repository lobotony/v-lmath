module lmath

struct Vec3 {
    pub mut:
    x f32
    y f32
    z f32
}

pub fn (self Vec3) equals(other Vec3) bool {
    return equalsf(self.x, other.x) && 
           equalsf(self.y, other.y) &&
           equalsf(self.z, other.z)
}

pub fn (self Vec3) scale(s f32) Vec3 {
    return Vec3{self.x*s, self.y*s, self.z*s}
}

pub fn (self Vec3) plus(other Vec3) Vec3 {
    return Vec3{self.x+other.x, self.y+other.y, self.z+other.z}
}

pub fn (self Vec3) minus(other Vec3) Vec3 {
    return Vec3{self.x-other.x, self.y-other.y, self.z-other.z}
}

pub fn (self Vec3) square_mag() f32 {
    return self.x*self.x + self.y*self.y + self.z*self.z
}

pub fn (self Vec3) mag() f32 {
    return C.sqrtf(self.square_mag())
}

pub fn (self Vec3) normalize() Vec3 {
    return self.scale(1.0/self.mag())
}

pub fn (self Vec3) distance_to(other Vec3) f32 {
    return (other.minus(self)).mag()
}

pub fn (self Vec3) dot(other Vec3) f32 {
    return self.x*other.x + self.y*other.y + self.z*other.z
} 

pub fn (self Vec3) cross(other Vec3) Vec3 {
    return Vec3{self.y*other.z - self.z*other.y, self.z*other.x - self.x*other.z, self.x*other.y - self.y*other.x}
}
