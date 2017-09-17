//: Playground - noun: a place where people can play

import UIKit

// guard문 == if문과 비슷
// guard문은 조건이 충족되지 않았을 경우 수행되며, 이후의 문장들이 안전하게 수행되도록 보장하는 역할을 한다.

// x가 옵셔널이므로, nil일 가능성이 있다.

func fooManualCheck(x: Int?) {
    if x == nil || x <= 0 { // x! <= 0 도 가능하다.
        // x가 nil이거나 0이하이면, 일을 하도록 문장을 삽입
        print("x는 fail")
        return
    }
    
    // x를 강제 언래핑하여 일을 함, 이때 x는 확실하게 nil이 아님
    x!.description
}

fooManualCheck(100)
fooManualCheck(-100)
fooManualCheck(nil)

// x가 nil인가 검사하여, nil이 아니면, 언래핑시킨후 메서드를 수행하거나, 속성값을 출력

// if let문을 사용함, 이때 x는 implicitly unwrap됨
func fooBinding(x: Int?) {
    if let x = x where x > 0 {
        // Do stuff with x
        // x!를 사용할 필요가 없다.
        x.description
    }
}

// guard else를 이용한 비강제 해제
func fooGuard(x: Int?) {
    guard let x = x where x > 0 else {
        // 위의 조건을 만족하지 않을 경우 수행됨
        return
    }
    
    // x는 guard-else문에 의해 비강제 해제되었음
    // 안심하고 x의 메서드를 호출할 수 있음
    x.description
}

// 비옵셔널 변수에 대한 guard문
func fooNonOptionalGood(x: Int) {
    guard x > 0 else {
        // x가 0보다 큰 양수라는 조건을 충족하지 않으면 수행되는 문장
        return
    }
    
    // x > 0 조건이 충족되면 수행되는 문장
}

// 비옵셔널 변수에 대한 if문의 예
func fooNonOptionalBad(x: Int) {
    if x <= 0 {
        // x가 0이거나 음수일 경우 수행되는 문장
        return
    }
    
    // x > 0 조건이 충족되면 수행되는 문장
}

// guard문의 장점
// 프로그래머가 진짜 검사하고자 하는 조건에 대한 검사를 수행한다.
// 조건이 충족되지 않으면 guard문의 else문에서 처리한다.
// guard 조건문을 통과하면 옵셔널 변수는 자동 해제된다.
// 프로그래머는 나쁜 상황에 대한 조건 검사만 하면 되므로, 함수 코드의 가독성이 높아지고 유지보수가 쉬워진다.
// 비옵셔널 값에 대해서도 사용가능하다.


