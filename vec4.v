module lmath

struct vec4 {
    pub mut:
    x f32
    y f32
    z f32
    w f32
}

pub fn (self vec4) equals(other vec4) bool {
    return equalsf(self.x, other.x) && 
           equalsf(self.y, other.y) &&
           equalsf(self.z, other.z) &&
           equalsf(self.w, other.w)
}

pub fn (self vec4) xyz() vec3 {
    return vec3{self.x, self.y, self.z}
}

pub fn (self vec4) scale(s f32) vec4 {
    return vec4{self.x*s, self.y*s, self.z*s, self.w*s}
}

pub fn (self vec4) plus(other vec4) vec4 {
    return vec4{self.x+other.x, self.y+other.y, self.z+other.z, self.w+other.w}
}

pub fn (self vec4) minus(other vec4) vec4 {
    return vec4{self.x-other.x, self.y-other.y, self.z-other.z, self.w-other.w}
}

pub fn (self vec4) square_mag() f32 {
    return self.x*self.x + self.y*self.y + self.z*self.z + self.w*self.w
}

pub fn (self vec4) mag() f32 {
    return C.sqrtf(self.square_mag())
}

pub fn (self vec4) normalize() vec4 {
    return self.scale(1.0/self.mag())
}

pub fn (self vec4) distance_to(other vec4) f32 {
    return (other.minus(self)).mag()
}

pub fn (self vec4) dot(other vec4) f32 {
    return self.x*other.x + self.y*other.y + self.z*other.z + self.w*other.w
} 
