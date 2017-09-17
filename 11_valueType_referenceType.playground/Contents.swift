//: Playground - noun: a place where people can play

import UIKit

struct PersonInfo {
    // struct의 속성(property)이라고 함
    var SSN: Int // 변수 속성
    let age: Int // 상수 속성
}

var person1 = PersonInfo(SSN: 111222, age: 23)

person1.SSN = 112233
person1

// 구조체 내부의 상수속성 let은 변경이 불가능
// person1.age = 9

// 상수 구조체의 저장속성은 변경이 불가능 - 아래 주석문은 error
let person2 = PersonInfo(SSN: 4, age: 29)
// person2.SSN = 888888

// 값 타입은 struct, enum, tuple이 있음
// 각 인스턴스마다 데이터의 복사본을 가진다.
// 참조타입은 class가 있음
// 각 인스턴스는 하나의 데이터의 복사본을 가지며, 이 복사본을 공유한다.

struct Round {
    var radius: Double = 0.0
    var area: Double = 0.0
}

var r = Round()
var copy_r = r
// Round r 과 Round copy_r이 각각 다른 인스턴스로 생성, 유지(구조체)

copy_r.radius = 10
r

class Circle {
    var radius: Double = 0.0
    var area: Double = 0.0
}

var c = Circle()
var copy_c: Circle
copy_c = c
// Circle c와 Circle copy_c가 참조하는 인스턴스는 같다.

c.radius = 10
copy_c



// 상수 값타입
struct value1 {
    var a = 10
}

var val3 = value1()
val3.a = 100

let val4 = value1()
// 다음은 에러 발생
//val4.a = 100


// 상수 참조 타입
class OtherReference {
    var a = 10
}

// 변수형 클래스의 속성은 당연히 변경 가능함
var ref3 = OtherReference()
ref3.a = 100

// 상수형 클래스의 속성 역시 변경 가능함
let ref4 = OtherReference()
ref4.a = 100

// 상수형 ref4는 새 인스턴스를 참조하도록 할 수 없음
// ref4 = ref3
// 하지만 다음은 가능함
ref3 = ref4



