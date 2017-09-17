//: Playground - noun: a place where people can play

import UIKit

// 객체를 생성하는 용도가 아니라, 상속을 통해서 물려받은 클래스가 반드시 가져야할 프로퍼티와 메서드를 정의하는 용도 == 인터페이스
// 특정 객체가 갖추어야할 기능이나 속성에 대한 설계도
// 이 프로토콜을 이용하는 객체에서 내용을 정의함
// 실질적인 내용은 없는 프로퍼티나 메서드의 단순 선언문
// 프로퍼티에 선언된 프로퍼티나 메서드를 프로토콜의 명세(specification)이라 한다.
// 클래스는 선언시 : 뒤에 구현해야할 프로토콜을 적어줌

// SampleProtocol 프로토콜 선언
protocol SampleProtocol {
    func desc(name: String)
}

// var sample: SampleProtocol = SampleProtocol() // 이렇게 사용하는것이 아니다.

// 구조체 Man, Woman, 클래스Person 모두 desc()를 구현해야 함
struct Man: SampleProtocol {
    func desc(name: String) {
        print("남자의 이름은 \(name)입니다.")
    }
}

struct Woman: SampleProtocol {
    func desc(name: String) {
        print("여자의 이름은 \(name)입니다.")
    }
}

class Person: SampleProtocol {
    func desc(name: String) {
        print("사람의 이름은 \(name)입니다.")
    }
}

// 프로토콜을 구현하지 않을 경우, 컴파일 오류가 발생함
//class Animal: SampleProtocol {
//    var name: String?
//}

// 초기화 구문 역시 프로토콜에서 작성할 수 있다.
// 메서드와 마찬가지로 실행블록을 작성하지 않음
// 매개변수 타입뿐만 아니라 반드시 매개변수 명까지 일치해야한다.
// 클래스에서 초기화 구문을 프로토콜을 통해 구현할때는 required 키워드를 붙여야한다.

protocol InitProtocol {
    init()
    init(name: String)
}


struct StructInit: InitProtocol {
    var name: String
    init() {
        self.name = "홍길동"
    }
    init(name: String) {
        self.name = name
    }
}

// class에서 init()을 구현할 경우 required 키워드 사용
class ClassInit: InitProtocol {
    var name: String
    required init() {
        self.name = "홍길동"
    }
    required init(name: String) {
        self.name = name
    }
}

// swift는 다중상속을 허용하지 않는다.

class OtherClass {
    var name: String?
}

class ParentClass_01 {
    init() {}
}

//class ChildClass: ParentClass, OtherClass {}

// 클래스는 다중상속은 허용하지 않지만, 상속과 프로토콜 구현을 동시에 선언할 수 있다.
// 상속과 프로토콜에서 동시에 init()이 있을 경우, override required 키워드를 동시에 추가한다.
protocol TestProtocol {
    init()
}

class ParentClass {
    init(){
    }
}

class ChildClass: ParentClass, TestProtocol {
    override required init(){}
}


// 클래스를 이미 구현한 후에, 수정할 필요가 생길경우,
// 클래스 코드를 수정하면 되지만, extension을 통해서, 클래스를 확장시키는 방법도 있다.
// 확장 구문에서 프로토콜을 구현한다면, 이후에 해달 클래스는 프로토콜을 구현한 것으로 처리된다.
// 기존 클래스를 수정하지 않아도 된다는 장점이 있음

// Guest클래스를 정의하였다.
class Guest {
    var name: String?
    init(name: String = "홍길동") {
        self.name = name
    }
}

protocol Reservation {
    func printReservation()
}

// Guest클래스의 기능을 extension을 통해서 확장시킴
extension Guest: Reservation {
    func printReservation() {
        print("\(self.name) 님이 9:00에 예약하셨네요.")
    }
}

var guest = Guest(name: "홍길순")
guest.printReservation()
