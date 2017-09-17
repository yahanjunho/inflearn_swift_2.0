//: Playground - noun: a place where people can play

import UIKit

// 클래스나 구조체의 메서드는 호출하기 전에 반드시 인스턴스가 nil인가 검사를 해야한다.
// 클래스나 구조체 인스턴스의 안정성 검사가 필요함

struct Person {
    var name: String?
    var age: Int
}

var person: Person? = Person(name:"홍길동", age:27)

person = nil
// print("이름은 \(person!.name!)입니다.") // 바로 윗줄에 person에 이미 nil을 할당했으므로, error

// if문을 이용하여, 옵셔널을 언래핑 시키는것, 옵셔널 바인딩
if person != nil {
    if person!.name != nil {
        print("이름은 \(person!.name!) 입니다.")
    }
}

// 옵셔널 타입을 언래핑하기 위하여, !연산을 사용하지 않아도, 문맥상 값을 가지는 것이 명백하다면, let사용, 즉 nil을 가질 가능성이 없다면,) 이 옵셔널 타입은 비강제해제(implicitly unwrapping) 된다.

// 이 person은 optional person이다.
person = Person(name:"홍길동", age:27)

person!
if let b = person {
// 이 블록의 b는 확실히 nil이 아니다.(자동으로 언래핑) 따라서 넌옵셔널
    b
    // b! // 비강제 해제된 값은 더이상 옵셔널이 아니므로, !를 통해 더이상 강제헤제를 할 수 없다.
    if let name = b.name {
        //name! // 이미 상단 if let구문에서, implicitly 언래핑 되어, 넌옵셔널타입이 되었으므로, 그 상태에서 강제언래핑은 불가능하다.
        name
        // name은 확실히 nil이 아닐것이다.
        // 강제해제(forced unwrapping, '!')를 사용안해도, implicitly unwrapping이 가능하다.
        print("이름은 \(name) 입니다.")
    }
}

// 옵셔널 체인
// 비강제 해제를 위해서는 if문을 통한 검사가 필요하다. 즉, 많은 if문이 필요함.
// 옵셔널 타입으로 정의된 값이 하위 프로퍼티나 메서드를 가질때, 이를 if문을 사용하지 않고도 간결하게 사용할 수 있도록 함
// 옵셔널 선언시에 사용하는 ?를 그대로 사용함.
// cwnu.president는 cwnu인스턴스가 옵셔널일 경우, president라는 멤버를 호출하기 위해, !로 강제 언래핑이 필요하며, cwnu가 nil일 경우 crash가 발생함.
// 옵셔널체인은 cwnu?.persident 와 같이 ?를 연속하여 사용함.


struct University {
    var president: Person?
    var universityName: String?
    var numOfStudents: Int
}

// 더 복잡한 예
var cwnu: University? = University(president: person, universityName: "창원대학교", numOfStudents: 8400)

// if구문이 3개나 쓰이는 불편한 구문
if let university = cwnu {
    if let president = university.president {
        if let name = president.name {
            print("총장의 이름은 \(name) 입니다.")
        }
    }
}

// cwnu = nil
if let name = cwnu!.president!.name {
    print("총장의 이름은 \(name) 입니다.") // 만약 위의 cwnu가 nil일 경우, crash됨
}

// 옵셔널 체인을 사용
if let name = cwnu?.president?.name {
    print("총장의 이름은 \(name) 입니다.")
}

//cwnu = nil
cwnu?.president?.name = "너총장" // cwnu가 nil이므로, cwnu?.부터 nil이므로, 결국 nil에 "너총장"이란 값이 할당이 불가능하고, 이 결과 또한 nil로 나온다. 그리고 cwnu가 nil이 아니라면, 결국 저기서 name또한 옵셔널 타입이므로, "너총장"이라는 값이 할당된다면, name 또한 옵셔널이 된다.
print(cwnu!.president!.name)


// 옵셔널 연산자로 처리된 구문에 계속해서 옵셔널 연산자를 붙여서 코딩을 할 수 있다.
// 옵셔널 체인을 이용하여 값을 할당할 수 있다.
// 옵셔널 체인으로 참조된 값은 옵셔널 타입으로 변환된다.
// 옵셔널체인이라는 구문은 중간에 nil을 반환할 가능성을 가지고 있다.
// 옵셔널 체인이 적용된 객체가 nil이라도 오류가 발생하지 않는다. //cwnu = nil, cwnu?.president?.name = "너총장"





