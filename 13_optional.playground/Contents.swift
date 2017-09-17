//: Playground - noun: a place where people can play

import UIKit

// 원칙 : 스위프트의 변수는 nil이 될 수 없다.
var movie = "꺠어난 포스"
// movie = nil  // error

// 다음 경우도 오류
//var otherMovie: String = nil

// 문자열 "100"을 정수형으로 변환하기 위해서는 Int("100")을 사용한다. 이때 Int("...")문장은 입력 문자열 값에 따라 값이 없을수도 있다. 이럴 경우 nil을 반환한다.

// 정상적으로 값을 반환할 수 있는 경우
var num = Int("100")
num

var otherNum_01 = Int("Hello")
otherNum_01

var otherNum_02: Int? = Int("Hello")
otherNum_02

// 일반변수가 가질 수 있는 값 - 실제 메모리의 값
// 옵셔널 변수가 가질 수 있는 값 - 실제 값 또는 nil 값

// Optional 변수는 선언시에 ?을 형(type)뒤에 넣어준다.
// Optional 변수에는 nil을 assign 할 수 있다.

// 원칙 : Optional 변수는 nil이 될 수 있다.
var optionalMovie1: String? = "깨어난포스"
optionalMovie1
var optionalMovie2: String? = nil
optionalMovie2 = "깨어난포스"

// 형 추정에 따른 옵셔널 변수
// 정상적으로 값을 반환할 수 있는 경우
var num_01 = Int("100")
num_01

// 이때의 num_01변수는 Int형? Int?형??
// Int("...")은 옵셔널Int형을 반환한다.
// 즉, Int("100") -> 숫자 100이 아닌, Optional(100)이 반환된다.
// Optional(100)은 nil이 될 가능성이 있는 옵셔널이라는 의미로, Wrapped Optional이라 한다.
// Wrapped Optional간의 (덧셈)연산은 불가능하다.
// 이러한, Wrapped Optional의 Wrapped를 벗기는 연산이, ! (Unwrappeding)연산자이다.
// Optional(100)! -> 100

var num_02: Int? = Int("100")
num_02

// Int("...")은 옵셔널Int을 반환하므로 다음은 오류
//var num_03: Int = Int("100")
//num_03

// Int("...")은 옵셔널Int형을 반환한다.
// 즉, Int("100") -> 숫자 100이 아닌, Optional(100)이 반환된다.
// Optional(100)은 nil이 될 가능성이 있는 옵셔널이라는 의미로, Wrapped Optional이라 한다.
// Wrapped Optional간의 (덧셈)연산은 불가능하다.
// 이러한, Wrapped Optional의 Wrapped를 벗기는 연산이, ! (Unwrappeding)연산자이다.
// Optional(100)! -> 100

// var n = Int("100") + Int("300") // Optional(100) + Optional(300)
var n = Int("100")! + Int("300")!

// 옵셔널 String과 비옵셔널 String
var optionalString: String?
var nonOptionalString: String = "abc"
// optional변수에 아무런 값을 할당하지 않으면, nil값을 가진다.
optionalString

// 아래와 같이 !로 강제 unwrapping하면 non-optional이 되어 오류발생
// 비옵셔널변수는 nil을 가질 수 없다.
// optionalString! // nil에 대해서 !을 수행 -> 오류발생

// 옵셔널변수에 새로운 값을 할당
optionalString = "abcd"
print(optionalString)

// optional변수는 강제 unwrapping하여 새로운 값 할당
optionalString! = "abcd"
print(optionalString!)

// a! = b, a를 강제 언랩핑한 값에 b를 할당한다.

// optionalString! = nil // optionalString을 !을 통해, 옵셔널변수를 언랩핑하여, non-optional타입으로 바꿔서, String만 할당 가능한 상태에서 nil할당이므로 에러
optionalString?.uppercaseString

// optional변수에 메세지를 주면 에러가 발생
// optionalString.uppercaseString // error
let str01 = optionalString!.uppercaseString
let str02 = optionalString?.uppercaseString







