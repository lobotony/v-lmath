module lmath

struct vec3 {
    pub mut:
    x f32
    y f32
    z f32
}

pub fn (self vec3) equals(other vec3) bool {
    return equalsf(self.x, other.x) && 
           equalsf(self.y, other.y) &&
           equalsf(self.z, other.z)
}

pub fn (self vec3) scale(s f32) vec3 {
    return vec3{self.x*s, self.y*s, self.z*s}
}

pub fn (self vec3) plus(other vec3) vec3 {
    return vec3{self.x+other.x, self.y+other.y, self.z+other.z}
}

pub fn (self vec3) minus(other vec3) vec3 {
    return vec3{self.x-other.x, self.y-other.y, self.z-other.z}
}

pub fn (self vec3) square_mag() f32 {
    return self.x*self.x + self.y*self.y + self.z*self.z
}

pub fn (self vec3) mag() f32 {
    return C.sqrtf(self.square_mag())
}

pub fn (self vec3) normalize() vec3 {
    return self.scale(1.0/self.mag())
}

pub fn (self vec3) distance_to(other vec3) f32 {
    return (other.minus(self)).mag()
}

pub fn (self vec3) dot(other vec3) f32 {
    return self.x*other.x + self.y*other.y + self.z*other.z
} 

pub fn (self vec3) cross(other vec3) vec3 {
    return vec3{self.y*other.z - self.z*other.y, self.z*other.x - self.x*other.z, self.x*other.y - self.y*other.x}
}
