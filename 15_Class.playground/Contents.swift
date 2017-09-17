//: Playground - noun: a place where people can play

import UIKit

// swift는 객체지향 프로그래밍의 특징을 가진다.
// 클래스를 통하여 인스턴스를 속성과 메서드를 정의한다.
// 값을 저장하는 속성(프로퍼티)을 가진다.
// 함수적인 기능을 제공하는 메서드를 가진다.
// 객체를 초기상태로 설정하는 초기화 블록을 정의할 수 있다.
// 객체의 기능을 확장하는 기능을 제공한다. - extension
// 한 클래스의 기능을 다른 클래스가 물려받아 사용하는 상속기능이 있다.
// 클래스 인스턴스에 할당된 리소스를 인스턴스 소멸시 직접 해제하는 기능(소멸화 구문)을 가진다.

class VideoMode {
    // 값을 저장하는 프로퍼티
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    // 인스턴스의 행위를 정의하는 메서드
    func description() -> Void {
        if let className = name {
            print("VideoMode 클래스의 설명: \(className)")
        }
    }
}

// VideoMode()를 통해 인스턴스를 생성
var aVideo = VideoMode()

// 인스턴스의 프로퍼티에 값을 준다.
aVideo.interlaced = true
aVideo.name = "1080i"

// 인스턴스의 메서드 호출을 통해 일을 시킨다
aVideo.description()

// 클래스에서 프로퍼티의 초기값을 할당하지 않으면 오류
//class Car {
//    var speed
//}

//class Car {
//    var speed: Int = 0
//    var color: String = "Red"
//}

// 또는 init()초기화 구문을 사용
class Car_01 {
    var speed: Int
    var color: String
    init() {
        speed = 0
        color = "Red"
    }
    init(color: String) {
        speed = 0
        self.color = color
    }
}

// init(), 인스턴스가 생성되는 시점에 자동적으로 호출됨, 파라미터 갯수등에 따라 2개 이상 init()을 정의해줄 수 있다.
class Car_02 {
    var speed: Int
    var color: String
    
    // 초기화 구문이 있을경우, 초기화는 반드시 하지 않아도 된다.
    init() { // 파라미터 없이 인스턴스가 생성되는경우
        speed = 0
        color = "Red"
        print("Car 인스턴스가 생성되어 프로퍼티가 초기화됨")
    }
    init(color: String) { // 파라미터를 주고 인스턴스가 생성되는경우.
        speed = 0
        self.color = color // self.color는 매개변수 color와 구분되는, 현재 인스턴스의 프로퍼티이다.
        print("Car 인스턴스가 생성되어 프로퍼티가 초기화됨")
    }
    
    deinit { // 소멸자
        print("Car 인스턴스 해제됨")
    }
    
    func desc() {
        print("Car.speed = \(self.speed)")
        print("Car.color = \(self.color)")
    }
}

var aCar: Car_02? = Car_02()
aCar!.speed
aCar!.color
aCar!.desc()
aCar = nil // ARC에 의해서, Car_02()객체를 참조하는 aCar변수가 해제되었고, Car_02()의 count가 1에서 0으로 줄어서, 메모리에서 인스턴스가 해제되고, deinit{}인 소멸자가 호출되어 실행

var bCar: Car_02? = Car_02(color: "blue")
bCar!.desc()
bCar = nil

// deinit, 인스턴스가 해제되는 시점에 자동적으로 호출됨, ()없음, 왜냐하면, 해제하는건데 파라미터가 필요할 일이 없음 즉 매개변수가 필요없기 때문임.

// 상속 - 현재 클래스의 프로퍼티와 메서드를 자식 클래스에게 물려줌 - 객체지향 프로그래밍의 장점
class RaceCar:  Car_02 {
    var hasTrubo: Bool
    override init() { // 오버라이딩 - 부모클래스의 메서드를 물려받아, 자식에서 추가적인 기능을 확장하는것, override키워드사용
        hasTrubo = true
        super.init() // super - 현재클래스의부모클래스를 참조하는 참조자
                     // super.init() 초기화 블록이나, super.func()메서드를 호출하여, 부모클래스의 메서드를 사용할 수 있다.
        print("RaceCar instance가 생성되어 초기화됨")
    }
    
    override func desc() {
        print("Car.speed = \(self.speed)") // self는, 클래스의 인스턴스를 의미
        print("Car.color = \(self.color)") // self.color는 매개변수 color와 구분되는, 현재 인스턴스의 프로퍼티이다.
        
        print("hasTurbo = \(self.hasTrubo)")
        super.desc()
    }
}

var myCar = RaceCar()
myCar.desc()

// final클래스
// 클래스 선언시에 final키워드가 붙으면, 상속이 차단되는 클래스가 된다.
// 이 final클래스로 서브클래싱을 할 수 없다.
// 보안상 필요한 경우나, 상속을 목적으로 하지 않는 클래스의 경우에 사용, 즉, 상속을 하지 않는, 부모클래스를 만들때 사용
