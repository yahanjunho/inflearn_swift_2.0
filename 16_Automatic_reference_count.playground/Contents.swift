//: Playground - noun: a place where people can play

import UIKit

// 자동참조계수
// java는 가비지콜렉터를 사용함, 메모리 관리는 편리하나, 가비지컬렉터가 수시로 실행되어, 시스템에 부하를 준다. / full, minor등 수시로 수행
// C, C++은 개발자가 할당한 동적메모리를 직접 해제해야 한다. 에러의 가능성이 높다.
// 자동참조관리 기법
// 프로그램의 메모리 사용을 자동참조계수를 통해 추적하고 관리
// 필요없는 클래스의 인스턴스의 메모리를 자동적으로 해제
// 클래스의 인스턴스에만 적용

// ARC작동원리, ARC - Automatic Reference Counting
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "홍길동") // Person의 arc = 1, ARC가 Person인스턴스 메모리 유지 시작, 참조 +1

reference2 = reference1 // Person의 arc = 2, 참조 +2
reference3 = reference1 // Person의 arc = 3, 참조 +3

reference1 = nil // Person의 arc = 2, 참조 +2
reference2 = nil // Person의 arc = 1, 참조 +1
reference3 = nil // Person의 arc = 0 // 이 시점에서, Person의 인스턴스가 메모리 해제, deinit{} 호출함
// Person 인스턴스의 참조가 모두 없어져, ARC가 Person 인스턴스 메모리 할당 해제

// 강한참조순환
class Person_01 {
    let name: String
    var apartment: Apartment?
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let number: Int
    var tenant: Person_01?
    init(number: Int) { self.number = number }
    deinit { print("Apartment #\(number) is being deinitialized") }}

var john: Person_01?
var number73: Apartment?

// Person과 Apartment가 1개 이상의 참조가 생겨, ARC가 각각의 인스턴스를 메모리 유지 시작
john = Person_01(name: "John Appleed") // person arc=1, reference count, fc
number73 = Apartment(number: 77) // apartment arc=1

// Person과 Apartment인스턴스가 서로를 강한 참조를 하게됨
john?.apartment = number73 // apartment arc=2
number73?.tenant = john // person arc=2

// 인스턴스를 참조하는 변수들을 해제시켜도, 인스턴스간의 강한 참조가 남아, 할당 해제가 되지 않는다.
// 참조할 방법이 존재하지 않는 객체들이 해제되지 않고 남아, 메모리를 차지함, 메모리 누수
// 인스턴스간 참조하는걸 해제할 방법이 없다. john?.apartment = number73 이렇게 할당후, john을 nil할당했으니...
// 직접, Person 인스턴스가 위치한 메모리 주소를 찾아서 해제하는 수밖에는 없다고 본다.

//john!.apartment = nil
//number73!.tenant = nil

john = nil // person arc=1
number73 = nil // apartment arc=1

// 해결
//var john: Person_01?
//var number73: Apartment?
//
//john = Person_01(name: "John Appleed") // person arc=1, reference count, fc
//number73 = Apartment(number: 77) // apartment arc=1
//
//john!.apartment = number73
//number73!.tenant = john
//
//john!.apartment = nil // 즉, 직접 john, number73을 nil할당하기전에, john과 number73객체가 직접 참조하는 변수에 대해 각각 nil로 할당 후에, john, number73을 nil로 할당한다. 근데 너무 어렵고 번거롭다? 실수할 가능성도 높다.
//number73!.tenant = nil
//
//john = nil
//number73 = nil

// 강한 참조 순환 방지 -> 약한 참조
// 약한 참조는 인스턴스가 다른 인스턴스를 참조할때, 참조 카운터를 유지하지 않고 참조함
// 참조하던 인스턴스가 할당 해제되면, nil을 할당
// 반드시 옵셔널 타입의 변수로 선언해야한다.

// 미소유참조
// 참조하는 인스턴스가 언제나 값을 가지고 있다고 간주
// 반드시 인스턴스를 참조하는게 확실할 때만 사용

class Person_02 {
    let name: String
    var apartment: Apartment_02?
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deinitialized") }
}

class Apartment_02 {
    let number: Int
    weak var tenant: Person_02? // Apartment인스턴스가 Person인스턴스에 대해 약한 참조를 한다.
    init(number: Int) { self.number = number }
    deinit { print("Apartment #\(number) is being deinitialized") }}

var john_02: Person_02?
var number73_02: Apartment_02?

john_02 = Person_02(name: "John Appleed") // person_02 rc=1
number73_02 = Apartment_02(number: 73) // apartment_02 rc=1

john_02!.apartment = number73_02 // apartment_02 rc=2
number73_02!.tenant = john_02 // person_02 rc=1, 왜냐하면, weak키워드로 인한 약한참조
// Apartment인스턴스가 Person인스턴스에 대해, 약한 참조를 함

john_02 = nil
number73_02 = nil
// john_02가 nil이 되면, Person인스턴스에 대한 강한 참조가 없으므로, ARC가 Person인스턴스를 할당 해제시킨다.
// john_02가 nil이 되면서,john_02!.apartment = number73_02 구문도 아예 성립이 안되어, number73_02의 rc도 1이 줄어들고 결국 Apartment인스턴에 대한 강한 참조가 사라져, Apartment 인스턴스도 할당 해제된다.

// reference를 가지고 동작하지만, 인스턴스를 해제해야할지 판단할때는 사용하지 않는다.
// 즉 참조를 하되, 강한참조가 없을경우 인스턴스는 해제된다.
// 약한참조는 참조할 인스턴스가 존재하지 않을 가능성이 있으므로, 항상 옵셔널타입에 적용된다.

// unowned reference
// 약한 참조는 참조할 인스턴스가 존재하지 않을 가능성이 있으므로, 항상 옵셔널 타입에 적용된다.
// 옵셔널이 아닌, 프로퍼티가 강한 참조를 가지지 않게 하려면?
// 프로퍼티가 nil을 가지지 않는 것을 전제로하는 unowned reference를 사용한다.
// unowned 키워드를 프로퍼티 앞에 사용

// 미소유 참조
class Employee {
    var name: String
    var team: Team?
    
    init(name: String) {
        print("Employee init")
        self.name = name
        self.team = nil
    }
    
    deinit {
        print("Employee deinit")
    }
}

// Team클래스의 leader프로퍼티가 미소유 참조임
// Team클래스는 항상 leader프로퍼티를 가져야한다. (옵셔널이 아님)
// 하지만, 강한참조는 아니므로, 참조사이클이 생기지 않는다.
class Team {
    var name: String
    unowned var leader: Employee
    
    init(name: String, leader: Employee) {
        print("Team init")
        self.name = name
        self.leader = leader
    }
    
    deinit {
        print("Team deinit")
    }
}

var emp1: Employee? = Employee(name: "홍길동") // employee rc=1
var team1: Team? = Team(name: "개발팀", leader: emp1!) // team rc=1, employee rc=2
emp1!.team = team1 // team rc=2

team1 = nil // team rc=1
emp1 = nil // employee rc=1

