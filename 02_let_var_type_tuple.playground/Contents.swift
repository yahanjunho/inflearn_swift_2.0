//: Playground - noun: a place where people can play

import UIKit

let constNum = 100
var varNum = 200

// 아래 문장은 오류를 일으킴
//constNum = 300

print("constNum = \(constNum)") // print == objective-c의 NSLOG

varNum = 300
print("new VarNum =\(varNum)")

/// 유니코드를 포함하여 어떠한 문자든 사용할 수 있음
let 한국어인사 = "헬로월드"
print(한국어인사)

// 형 추정 - num을 Int형으로 추정함
var num = 100
// 명시적으로 otherNum을 Int형으로 함
var otherNum:Int = 200;

// Bool형으로 추정함
// ;으로 한줄에 여러문장 입력 가능
var isRun = false; var isBroken = true

// 명시적으로 isSleep의 형을 Bool형으로 함
var isSleep: Bool = true

// String형으로 추정함
var stringA = "문자열 타입"
var stringB: String = "명시적 문자열 타입"

// Array형으로 추정함
let constnatsNum = ["one", "two", "three", "four"]
// Dictionary 형으로 추정함
let variablesNum = ["one":1, "two":2]

///////
let sayHello: String = "hello"
var someInt: Int = 3
var otherInt: Int = 2
var intX, intY: Int
intX = 400
intY = 500

print("sayHello is \(sayHello)")
print("someInt is \(someInt)")
print("otherInt is \(otherInt)")

// playground에서는 다음과 같은 방법으로 값을 확인할 수 있다.
sayHello
"\(sayHello)"
someInt
otherInt


// 주석은 // /* */
// C언어와 같이 /*..*/ 주석문이 가능하다.
/*sayHello
"\(sayHello)"
someInt
otherInt*/


// Int, UInt, Double, Float, 1.2e2 = 1.2*10^2
// Bool, Character, String

// 문자형 표기 오류
//var ch0: Character = 'a'
var ch1: Character = "A"

// 문자형 표기 오류
//var ch2: Character = "ABC"

// ()안에 ,쉼표를 이용해서 동일한 형, 또는 서로 다른 형의 자료값을 묶어 하나의 자료형으로 취급할 수 있음
(1,2,3)
(3.14, 1.414)
(123, "Busan", "Seagull")

// 튜플 상수
let errorCode = (230, "null point assignment")
errorCode.0
errorCode.1

// 튜플 변수, 변수형 튜플로써 요소의 값을 변화 시킬 수 있다.
var httpError = (404, "Not Found")
httpError.0
httpError.1

httpError.0 = 405
httpError

var (code, message) = httpError
print("code = \(code)")
print("message = \(message)")








