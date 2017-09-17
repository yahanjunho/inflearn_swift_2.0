//: Playground - noun: a place where people can play

import UIKit


func join(s1: String, s2: String, joiner: String) -> (String){
    return s1 + joiner + s2
}

join("hello", s2: "world", joiner: ", ")

func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String{
    return s1 + joiner + s2
}

join(string: "hello", toString: "world", withJoiner: ", ")

// 가변인자(variadic) 함수
// 함수구문에서 함수에 전달되는 매개변수의 수를 정확하게 알 수 없을 경우 사용하는 문법으로 ...으로 표시

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,2,3,4,5) // 다섯 정수의 산술평균 3.0을 반환함
arithmeticMean(3,8,19)

// 함수 타입(형)
// 함수형 변수
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func multTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

addTwoInts(1, b: 3)
multTwoInts(1, b: 3)

// 함수타입의 상수나 변수를 만들어 함수를 할당할 수 있음
var mathFunction:(Int, Int) -> Int
mathFunction = addTwoInts
mathFunction(1,3)

print("Result: \(mathFunction(1,3))")

// 함수형 변수에 레이블을 사용할 경우 error
// mathFunction(1, b:3)

mathFunction = multTwoInts
mathFunction(2,3)


func addTwoInts2(a: Int, b: Int) -> Int {
    return a + b
}

var mathFunction2: (Int,Int) -> Int = addTwoInts2
var newMathFunction: (Int, Int) -> Int

newMathFunction = mathFunction2
print("Result: \(mathFunction2(2,3)))")
print("Result: \(newMathFunction(3,3)))")

// 함수형을 매개변수로 사용
func printMathResult(mathFunction: (Int,Int)->Int, a: Int, b: Int) {
    print("Result: \(mathFunction(a,b))")
}
printMathResult(addTwoInts, a: 3, b: 5)


// 스텝함수 -1
func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

chooseStepFunction(true)(10)
chooseStepFunction(false)(10)

// 함수 내부에 다른 함수를 중첩할 수 있다.
func chooseStepFunction2(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    return backwards ? stepBackward : stepForward
}
chooseStepFunction2(true)(10)
chooseStepFunction2(false)(10)


