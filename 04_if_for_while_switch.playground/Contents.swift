//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var n = 10
var m = 20

if n == m {
    print("n and m is equal")
}
else if n < m {
    print("m is larger than n")
}
else {
    print("n is larger than m")
}

// 강력해진 for문
for index in 1...5 {
    "\(index) times 4 is \(index*4)"
}

for index in 1..<5 {
    "\(index) times 4 is \(index*4)"
}

var base = 2
var power = 9
var answer = 1

for _ in 1...power {
    answer *= base
}

for var i=0; i<10; i+=2 {
    i
}

// 문자열 나열하기
// String형을 Character형으로 열거하는 for-in
for ch in "HELLO".characters {
    print(ch)
}

for (idx, ch) in "HELLO".characters.enumerate() {
    print("index : " + String(idx) + " " + String(ch))
}

// while, repeat while문
n = 5
m = 10

while n < m {
    n+=1
}

// repeat-while == do~while문
n = 5
m = 10

repeat {
    n+=1
} while n < m

// switch문

var ch = "a"

switch ch {
case "A" : // 아무문장도 없으면 error
    fallthrough
case "a": "match"
default: "unmatch"
}

// range연산
var num = 3

switch num {
case 1...5: "small number"
case 6...10: "middle number"
default: "large number"
}

// ...은 정수형이 아닌, 문자형 연산도 가능하다.
var letter = "A"

switch letter {
case "A"..."Z": "알파벳 대문자"
case "a"..."z": "알파벳 소문자"
default: "알파벳 아님"
}

// case문에는 쉼표를 사용하여 다중값을 쓸 수 있다.
let aChar:Character = "e"

switch aChar {
case "a","e","i","o","u": print("\(aChar)는 모음")
case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z": print("\(aChar)는 자음")
default: print("\(aChar)는 자음도 모음도 아님")
}

// switch 튜플 매칭도 가능하며, 임의의 가능한 값을 지정하는 와일드카드로 _를 사용할 수 있다.
var point = (100,0)

switch (point) {
case (0,0): "point는 원점에 있습니다."
case (_,0): "point는 x축에 있습니다."
case (0,_): "point는 y축에 있습니다."
default: "point는 4분면 어딘가에 있습니다."
}

// let문을 이용하여, 조건이 맞을 경우에, 튜플 값을 변수에 할당할 수 있음
switch (point) {
case let (x,y): print("in point, x=\(x), y=\(y)")
}

point = (1,10)
// 값 바인딩까지 가능함

switch (point) {
case (0,0): "point는 원점에 있습니다."
case (let x, 0...2): // x에 point.0값을 할당함
    "x변수는 \(x)으로, point.0 값이 할당됨"
case (0...2, let y): "y변수는 \(y)으로 point.1 값이 할당됨"
default: "x,y가 0에서 2사이에 해당하지 않음"
}

// let~where문을 이용하여 튜플 값이 주어진 조건에 맞을 경우 실행하도록 할 수도 있음
"point element x = \(point.0), y = \(point.1)"

switch (point) {
case let (x,y) where x == y: "element \(x) and \(y) is the same"
case let (x,y) where x > y: "1st element \(x) is larger than \(y)"
case let (x,y) where x < y: "2nd element \(y) is larger than \(x)"
default: break
}

var strInput = "Swift is very fast"
var strOutput = ""

for ch in strInput.characters {
    switch ch {
    case " ": continue
    default: strOutput.append(ch)
    }
}
strOutput

strInput = "Swift is very powerful"
strOutput = ""

for ch in strInput.characters {
    switch ch {
    case " ": fallthrough
    default: strOutput.append(ch)
    }
}
strOutput




