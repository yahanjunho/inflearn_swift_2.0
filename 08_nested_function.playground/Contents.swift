//: Playground - noun: a place where people can play

import UIKit


func funcA() -> Int {
    var a = 10
    
    // 내부함수 funcB는 변수 a에 접근가능
    // funcA의 외부에서는 funcB를 접근할 수 없음. 은닉/캡슐화 가능
    func funcB() {
        a = a+10
    }
    funcB()
    
    return a
}

funcA()

//중첩함수 반환
func makeInc1() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return number + 1
    }
    return addOne
}

var increment = makeInc1()
increment(7)
increment(10)


func makeInc2(amount: Int) -> () -> Int {
    var runningTotal = 10
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

var newIncrement = makeInc2(5)
newIncrement()

var incFive = makeInc2(5)
incFive()
incFive()
incFive()

var incTen = makeInc2(10)
incTen()
incTen()
incTen()

// 함수를 매개변수로 받음
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

func lessThanZero(number: Int) -> Bool {
    return number < 0
}

var numbers = [20,19,7,12,22]

hasAnyMatches(numbers, condition: lessThanTen)
hasAnyMatches(numbers, condition: lessThanZero)




