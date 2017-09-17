//: Playground - noun: a place where people can play

import UIKit

// enum타입을 통한 오류 처리 가능
// ErrorType이라는 프로토콜을 구현하여, try catch처리가능
// 필요한 오류 목록을 정의할 수 있음.
enum CarEngineErrors: ErrorType { // enum타입은 없는 값이 들어올경우 옵셔널 처리한다.
    case NoFuel
    case OilLeak
    case LowBattery
}

// ErrorType : 내부적으로는 비어있는 프로토콜임
// ErrorType을 구현한다는 의미가 중요한 프로토콜임
// ErrorType프로토콜을 열거형에 추가한 후, 열거형 내에 오류들을 정의함

// 오류처리 함수 정의시에 throws를 반환형 앞에 추가, 오류를 throw하는 함수
// 함수선언뒤에 throws키워드를 넣음
// guard-else문을 이용하여 조건을 충족하지 않으면 throw

// throws의 함수형태는, 함수선언문의 ()뒤에 throws 키워드를 삽입
// throws가 없으면 일반 함수임

//func canThrowErrors() throws -> String
//func cnanotThorwErrors() -> String

func checkEngine() throws {
    let fuelReserve = 20.0
    let oilOK = true
    let batteryReserve = 0.0
    
    guard fuelReserve > 0.0 else {
        throw CarEngineErrors.NoFuel
    }
    guard oilOK else {
        throw CarEngineErrors.OilLeak
    }
    guard batteryReserve > 0.0 else {
        throw CarEngineErrors.LowBattery
    }
}

// do - try - catch 문

func startEngine() {
    do {
        try checkEngine()
    }
    catch CarEngineErrors.LowBattery {
        print("배터리 충전이 필요합니다.")
    }
    catch CarEngineErrors.NoFuel {
        print("기름이 부족합니다.")
    }
    catch { // 와일드카드 catch문, 앞에서 catch못하는 에러를 잡는다. 이외에 where문도 추가 가능하다.
        print("차량 점검이 필요합니다.")
    }
    
}

