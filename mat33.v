module lmath

/* OpenGL compatible 3x3 matrix in column major order
 *
 * m[0] m[3] m[6]
 * m[1] m[4] m[7]
 * m[2] m[5] m[8]
 */
struct Mat33 {
    pub:
    data [9]f32
}

pub fn (self Mat33) str() string {
    return  '${self.data[0]} ${self.data[3]} ${self.data[6]}\n' + 
            '${self.data[1]} ${self.data[4]} ${self.data[7]}\n' +
            '${self.data[2]} ${self.data[5]} ${self.data[8]}\n' 
}

pub fn (self Mat33) equals(other Mat33) bool {
    mut result := true

    for i := 0; i<9; i++ {
        if !equalsf(self.data[i], other.data[i]) {
            result = false
            break
        }
    }
    return result
}

pub fn mat33_zero() Mat33 {
    mut result := Mat33{}
    C.memset(&result, 0, sizeof(Mat33))
    return result
}

pub fn mat33_identity() Mat33 {
    mut result := mat33_zero()
    result.data[0] = 1.0
    result.data[4] = 1.0
    result.data[8] = 1.0
    return result
}

pub fn (self Mat33) get_col(index int) vec3 {
    match index {
        0 => { return vec3{self.data[0], self.data[1], self.data[2]} }
        1 => { return vec3{self.data[3], self.data[4], self.data[5]} }
        2 => { return vec3{self.data[6], self.data[7], self.data[8]} }
        else => { panic('index out of bounds: $index') }
    }
}

pub fn (self Mat33) get_row(index int) vec3 {
    match index {
        0 => { return vec3{self.data[0], self.data[3], self.data[6]} }
        1 => { return vec3{self.data[1], self.data[4], self.data[7]} }
        2 => { return vec3{self.data[2], self.data[5], self.data[8]} }
        else => { panic('index out of bounds: $index') }
    }
}

pub fn (self Mat33) get(row int, column int) f32 {
    assert (row >= 0) && (row < 3)
    assert (column >= 0) && (column < 3)
    return self.data[row*3+column]
}

pub fn (self mut Mat33) set(row int, column int, val f32) {
    assert (row >= 0) && (row < 3)
    assert (column >= 0) && (column < 3)
    self.data[row*3+column] = val
}

// swap two elements within a Mat44
fn (self mut Mat33) swap(i0 int, i1 int) {
    tmp := self.data[i0]
    self.data[i0] = self.data[i1]
    self.data[i1] = tmp
}

pub fn (self Mat33) transpose() Mat33 {
    mut result := Mat33{}
    result.swap(1,3)
    result.swap(2,6)
    result.swap(5,7)
    return result
}

pub fn (self Mat33) mult(other Mat33) Mat33 {
    mut result := Mat33{}

    lr0 := self.get_row(0)
    lr1 := self.get_row(1)
    lr2 := self.get_row(2)

    mut t := other.get_col(0)
    result.data[0] = lr0.dot(t)
    result.data[1] = lr1.dot(t)
    result.data[2] = lr2.dot(t)

    t = other.get_col(1)
    result.data[3] = lr0.dot(t)
    result.data[4] = lr1.dot(t)
    result.data[5] = lr2.dot(t)

    t = other.get_col(2)
    result.data[6] = lr0.dot(t)
    result.data[7] = lr1.dot(t)
    result.data[8] = lr2.dot(t)

    return result
}

pub fn (self Mat33) det() f32 {
    m := *f32(self.data)
    result :=   m[0] * (m[4] * m[8] - m[7] * m[5])
              - m[3] * (m[1] * m[8] - m[7] * m[2])
                m[6] * (m[1] * m[5] - m[4] * m[2])
    return result
}

pub fn (self Mat33) inverse() Mat33 {
    ood := f32(1.0) / self.det() // one over determinant

    mut result := Mat33{}

    m := *f32(self.data)
    
    result.data[0] =   (m[4] * m[8] - m[7] * m[5]) * ood
    result.data[3] = - (m[3] * m[8] - m[6] * m[5]) * ood
    result.data[6] =   (m[3] * m[7] - m[6] * m[4]) * ood
    result.data[1] = - (m[1] * m[8] - m[7] * m[2]) * ood
    result.data[4] =   (m[0] * m[8] - m[6] * m[2]) * ood
    result.data[7] = - (m[0] * m[7] - m[6] * m[1]) * ood
    result.data[2] =   (m[1] * m[5] - m[4] * m[2]) * ood
    result.data[5] = - (m[0] * m[5] - m[3] * m[2]) * ood
    result.data[8] =   (m[0] * m[4] - m[3] * m[1]) * ood

    return result
}

pub fn (self Mat33) transform(v vec3) vec3 {
    mut result := vec3{}
    result.x = self.get_row(0).dot(v)
    result.y = self.get_row(1).dot(v)
    result.z = self.get_row(2).dot(v)
    return result
}

pub fn mat33_rotate(angle f32, unnormalizedAxis vec3) Mat33 {
    c := C.cosf(angle)
    s := C.sinf(angle)

    axis := unnormalizedAxis.normalize()
    temp := axis.scale(1.0-c)

    mut result := mat33_identity()
    result.set(0,0,c + temp.x * axis.x)
    result.set(0,1,0.0 + temp.x * axis.y + s * axis.z)
    result.set(0,2,0.0 + temp.x * axis.z - s * axis.y)

    result.set(1,0,0.0 + temp.y * axis.x - s * axis.z)
    result.set(1,1,c + temp.y * axis.y)
    result.set(1,2,0.0 + temp.y * axis.z + s * axis.x)

    result.set(2,0,0.0 + temp.z * axis.x + s * axis.y)
    result.set(2,1,0.0 + temp.z * axis.y - s * axis.x)
    result.set(2,2,c + temp.z * axis.z)

    return result
}

pub fn matt3_scale(sx f32, sy f32 sz f32) Mat33 {
    mut result := mat33_identity()
    result.data[0] = sx
    result.data[4] = sx
    result.data[8] = sx
    return result
}



