//: Playground - noun: a place where people can play

import UIKit

// 구조체의 메서드는 기본속성이 변경불가능이다.

struct Celsius_ {
    var temperatureInCelsius: Double
}

let boilingPointOfWater_ = Celsius_(temperatureInCelsius: 212.0)
boilingPointOfWater_

// 구조체 내의 속성은 초기화 인자를 통해서 초기화 할 수 있다. 초기화 인자는 여러개 둘 수도 있다.
struct Point {
    var x = 0.0, y = 0.0
    
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}

var somePoint = Point(x: 4.0, y: 5.0)
somePoint.x += 10
somePoint

// 구조체와 열거형은 값타입이라서 인스턴스 생성후에는 메서드를 통해서 해당 인스턴스의 속성을 변경할 수 없다.
// mutating이라는 키워드를 인스턴스 메서드 앞에 선언하게 되면, 이 메서드를 통해서 속성 변경이 가능하다.
struct Point0 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
// mutating 키워드를 통해, 메서드 내에서 x,y속성을 바꿀 수 있음
// 디폴트 속성이 immutable이므로, mutable한 메서드는 func앞에 mutating이라는 키워드로 표시를 해준다.

let somePoint2 = Point0(x:100.0, y:100.0)
somePoint2.moveByX(10, deltaY: 20)
// 구조체 인스턴스가 상수 타입의 변수에 할당 될때는 mutating 사용 못함.


var somePoint0 = Point0()
somePoint0.moveByX(200.0, deltaY: 300.0)

var somePoint1 = Point0()
somePoint1.x = 100
somePoint1.y = 100
somePoint1.moveByX(2.0, deltaY: 3.0)


class Point2 {
    var x = 0.0, y = 0.0
    func moveByX(deltaX: Double, deltaY: Double) {
        x+=deltaX
        y+=deltaY
    }
}

// 클래스의 메서드는 mutable이므로, 다음은 ok
var somePoint3 = Point2()
somePoint3.moveByX(2.0, deltaY: 3.0)
somePoint3.x


// init메서드를 이용한 초기화
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0

// 구조체 속성의 접근과 변경


// 구조체와 열거형은 인스턴스 생성 후에는 메서드를 통하여 해당 인스턴스의 속성을 변경할 수 없다.
// 구조체의 메서드는 디폴트로 immutable속성을 가지며, 클래스의 메서드는 디폴트로 mutable속성을 가진다.
// 구조체의 메서드는 immutable로 프로그램의 안정성에 기여하고, 버그를 줄이는 역할을 한다. 
