//: Playground - noun: a place where people can play

import UIKit

func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(inout a: Double, inout b: Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoStrings(inout a: String, inout b: String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var n1 = 100
var n2 = 200

swapTwoInts(&n1, b: &n2)
n1
n2

func swapTwoValues<T>(inout a: T, inout b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

n1 = 100; n2 = 200
swapTwoValues(&n1, b: &n2)
n1
n2

var s1 = "Hello"; var s2 = "World"
swapTwoValues(&s1, b: &s2)
s1
s2

// 일반함수를 이용한 반복
func repeatInt(item: Int, times: Int) -> [Int] {
    var result = [Int]()
    for i in 1...times {
        result.append(item)
    }
    return result
}

repeatInt(3, times: 5)
repeatInt(4, times: 5)

func repeatString(item: String, times: Int) -> [String] {
    var result = [String]()
    for _ in 0...times {
        result.append(item)
    }
    return result
}

repeatString("Hi", times: 5)
repeatString("Hello", times: 3)

// 제너릭 함수 버젼
func repeatItem<T>(item: T, times: Int) -> [T] {
    var result = [T]()
    for i in 0...times {
        result.append(item)
    }
    return result
}

repeatItem("knock", times: 4)
repeatItem(10, times: 4)
repeatItem(1.1, times: 3)

