//: Playground - noun: a place where people can play

import UIKit

// 강한참조 : 객체에 대한 일반적인 참조방법으로, 참조계수(카운터)가 증가한다.
// 약한참조 : weak키워드로 정의한다. 참조는 하되, 참조계수(카운터)는 증가하지 않는다.
// 참조계수가 0이 되면, 약한 참조가 있더라도, 참조되는 객체는 해제된다. 즉 해당 0이 되는 객체가 참조하는 다른 객체의 카운터도 줄어든다.

// 미소유 참조 - 획득된 참조가 nil이 되지 않는 경우, onowned키워드 사용
// 클로저를 클래스 인스턴스의 속성에 할당할 경우에도 강한 참조 순환이 발생할 수 있다. 클로저인스터스와 클래스인스턴스가 서로 참조

// 획득(캡쳐)
// 클로저를 클래스 인스턴스의 속성에 할당할때도 강한 참조 순환이 발생할 수 있다.

// 해당 클로저의 몸체는 인스턴스를 획득(캡쳐)한다.

// 이 획득은 클로저의 몸체가 self.property와 같은 인스턴스의 속성에 접근할 때 발생
// 클로저가 self.method()와 같은 인스턴스 메서드를 호출할 떄도 발생한다.

// 클로저가 참조타입이기 때문에 발생됨

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = { // 인스턴스의 메서드가 아닌, 클로저 self.text, self.name을 참조함
        // asHTML변수가, 클로즈를 참조하고 있으므로, 클로저의 rc도 +1, rc = 1
        //[unowned self] in // 클로저 강한 참조 순환 방지
        if let text = self.text { // 클로저로 인해, HTMLElement의 rc + 1, rc = 2
            return "<\(self.name)>\(text) </\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello world") // HTMLElemnt의 rc = 1
paragraph!.asHTML()

paragraph = nil // 하지만, HTMLElement 인스턴스 내부적으로, 클로저와 각각 1번씩 참조하므로, 강한 순환 참조가 이어짐
// 인스턴스를 참조하는 변수를 해제시켜도, 인스턴스와 클로저의 강한 참조 때문에 할당 해제가 되지 않음
// HTMLElement의 deinit이 일어나지 않음


// 클로저 강한 참조 순환 방지
// 획득 목록 정의
//lazy var someClosuer: (Int, String) -> String = {
//    [unowned self] (index: Int, stringToProcess: String) -> String in
//}
// 파라미터 목록이나 반환 타입이 존재시

//lazy var someClouser() -> String = {
//    [unowned self] in
//}
// 파라메터 목록이나 반환 타입이 없을시


