//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

protocol DescriptionProtocol {
    var description: String { get }
    mutating func change()
}
// 構造体のプロトコル準拠
struct ExampleStructure : DescriptionProtocol {
    var description: String = "description"
    mutating func change() {
        description += " changed"
    }
}
// 列挙型のプロトコル準拠
enum CoinEnumeration: DescriptionProtocol {
    case 表, 裏
    var description: String {
        return "現在 \(self)" }
    mutating func change() { if self == .表 {
        self = .裏 }
    else {
        self = .表
        } }
}
var b = ExampleStructure()
b.change()
print(b.description)


var coin = CoinEnumeration.表
//
print(coin.description)
coin.change()
print(coin.description)
