//: Playground - noun: a place where people can play

import UIKit

// swift의 컬렉션타입에는 배열,집단,딕셔너리가 있다.
// 집한은 서로 다른값을 중복없이 저장하는 집단자료형이며, index가 없다.
// 합집합, 교집합, 배타적논리합, 차집합 및 포함관계, 서로소 검사등 함수를 지원한다.

// 집합, 배열과 유사하게 동일한 자료형의 값을 저장
// 서로 다른 값을 중복없이 저장하는 집단 자료형
// 배열은 값의 중복이 가능함.

var data = ["A", "B", "C"] // 이 경우, 디폴트로 배열형임
var setData: Set = ["A", "B", "C"] // 이게 바로 집합형

// var setData: Set<String> 으로도 정의

// 즉, Set형 선언을 하지 않고 집단데이터를 생성하면, 디폴트로 Array자료형으로 선언된다.
var arrayGenre = ["Action", "Documentary", "Romance", "Horror"]
var arrayString: Array = ["Action", "Documentary", "Romance", "Horror"]

// 집합형 자료
var movieGenre: Set = ["Action", "Documentary", "Romance", "Horror"]
var genre: Set<String> = ["Action", "Documentary", "Romance", "Horror"]

var myGenre: Set<String> = []
myGenre.insert("Action")
myGenre.insert("Romance")
myGenre.insert("Action") // Action을 추가해도 중복이라 더 추가가 안됨

myGenre.count

if myGenre.contains("Action") {
    print("Actions Genre is an element of myGenre")
} else {
    print("Action Genre is not included in myGenre")
}

//myGenre.remove("Action")
//myGenre.removeAll()

// insert():새 set element삽입
// contains():element가 set에 포함되어있는가 검사
// count: element원소 갯수확인
// isEmpty(), remove(), removeAll()도 있음

// Test
var yourGenre: Array<String> = []
yourGenre.insert("Action", atIndex: 0)
yourGenre.insert("Romance", atIndex: 1)


yourGenre.count

if yourGenre.contains("Action") {
    print("Action Genre is an element of yourGenre")
} else {
    print("Action Genre is not included in yourGenre")
}

yourGenre.insert("Action", atIndex: 2) // array는 중복된 element가 포함될 수 있음
yourGenre.count

// 순회탐색
// for ~ in이용, sort()메서드를 이용하여 정렬가능
for gen in myGenre {
    print("\(gen)")
}

for gen in myGenre.sort() {
    print("\(gen)")
}

// set은 집합연산을 제공
// a.intersect(b) - 교집합
// a.exclusiveOr(b) - 배타적 논리합
// a.union(b) - 합집합
// a.subtract(b) - 차집합 // a-b

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits)
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

// 집합의 포함관계와 서로소
let houseAnimals: Set = ["개", "고양이"]
let farmAnimals: Set = ["소", "닭", "양", "개", "고양이"]
let cityAnimals: Set = ["비둘기", "쥐"]

houseAnimals.isSubsetOf(farmAnimals) // true
farmAnimals.isSupersetOf(houseAnimals) // true

// farmAnimals와 cityAnimals는 서로소인가?
farmAnimals.isDisjointWith(cityAnimals) // true


