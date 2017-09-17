//: Playground - noun: a place where people can play

import UIKit

enum Compass {
    case North
    case South
    case East
    case West
}

enum CompassPoint {
    case North, South, East, West
}

var directionToBusan: Compass
directionToBusan = Compass.East
directionToBusan = .West

enum Barcode {
    case UPCA(Int, Int, Int, Int), QRCodes(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
//productBarcode = .QRCodes("ABCDEFGHIJK")

// productBarcode가 Barcode의 멤버중 일치되는 형이 있으면 진행
switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-a : \(numberSystem), \(manufacturer), \(product), \(check)")
case .QRCodes(let productCode):
    print("QR : \(productCode)")
}

// 원시값(Raw values):멤버가 가지는 이름에 데이터 값을 부여할 수 있다. 주로 숫자를 할당하여 편리하게 이용할 수 있다.
// .rawValue 속성을 이용해서 원시값을 읽어올 수 있다.(읽기 전용)
// Planet enumeration에 rawValue할당이 가능
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupitor, Saturn, Uranus, Neptune
}

enum Planets: Int {
    case Mercury, Venus, Earth, Mars, Jupitor, Saturn, Uranus, Neptune
}

Planet.Mercury
Planet.Mercury.rawValue
Planet.Venus.rawValue

Planets.Mercury.rawValue

let positionToFind = 3
let somePlanet = Planet(rawValue: 3)
let otherPlanet = Planet(rawValue: 100)

// 구조체
struct Resolution {
    var width = 0
    var height = 0
    func description() -> Void {
        print("Resolution width = \(width), height = \(height)")
    }
}

// 클래스
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    func description() -> Void {
        print("Video interlacing = \(interlaced)")
    }
}

var res = Resolution()
res.width = 1920
res.description()

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

// hd.width = 2048, let일 경우 에러 발생, 구조체인경우

// 간단한 프로퍼티와 메소드를 가지는 클래스의 예시
class Shape {
    var numOfSides = 0  // 프로퍼티(속성)
    func description() -> String {  // 메서드
        return "A shape with \(numOfSides) sides"
    }
}

var shape = Shape()
shape.numOfSides = 7
var shapeDescription = shape.description()

var otherShape = Shape()
otherShape.numOfSides = 4
otherShape.description()








