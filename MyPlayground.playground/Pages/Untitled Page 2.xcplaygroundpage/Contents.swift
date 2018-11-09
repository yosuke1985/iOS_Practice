////: [Previous](@previous)
//
//import Foundation
//
//var str = "Hello, playground"
//
////: [Next](@next)
//
//protocol DescriptionProtocol {
//    var description: String { get }
//    mutating func change()
//}
//// 構造体のプロトコル準拠
//struct ExampleStructure : DescriptionProtocol {
//    var description: String = "description"
//    mutating func change() {
//        description += " changed"
//    }
//}
//// 列挙型のプロトコル準拠
//enum CoinEnumeration: DescriptionProtocol {
//    case 表, 裏
//    var description: String {
//        return "現在 \(self)" }
//    mutating func change() { if self == .表 {
//        self = .裏 }
//    else {
//        self = .表
//        } }
//}
//var b = ExampleStructure()
//b.change()
//print(b.description)
//
//
//var coin = CoinEnumeration.表
////
//print(coin.description)
//coin.change()
//print(coin.description)
//
//
//
//public enum Test{
//    case a(String)
//    case b(Int)
//}
//
//var test = Test.a("test")
//print(test)
//
//
//struct StockTrade {
//
//    enum Trade {
//        case buy(stock: String, amount: Int)
//        case sell(stock: String, amount: Int)
//    }
//
//    //注文処理 銘柄や金額はTradeに全て含まれているので引数はTradeのみ
//    func order(type: Trade) {
//        //買いもしくは売り注文を処理する
//        switch type {
//        case let Trade.buy(stock, amount):
//            print("\(stock)株を\(amount)購入する")
//        case let Trade.sell(stock, amount):
//            print("\(stock)株を\(amount)売却する")
//        }
//
//    }
//
//}
//
//var stock = StockTrade()
//
//stock.order(type: .buy(stock:"Apple",amount: 100))
//stock.order(type: .sell(stock: "Google", amount: 200))
//
//
//
//
//enum Character {
//    enum Weapon {
//        case bow
//        case sword
//        case lance
//        case dagger
//    }
//    enum Helmet {
//        case wooden
//        case iron
//        case diamond
//    }
//    case thief
//    case warrior
//    case knight
//}
//
//
//
//
//let character = Character.Weapon.bow
//
//enum Fruit {
//    case apple
//    case banana
//    case orange
//    case melon
//
//    func inJapaneseName() -> String {
//        switch self {
//        case .apple:
//            return "りんご"
//        case .banana:
//            return "バナナ"
//        case .orange:
//            return "みかん"
//        case .melon:
//            return "メロン"
//        }
//    }
//}
//
//
//var fruit: Fruit = .apple
//
//Fruit.inJapaneseName(.orange)()
//
//
//enum Device {
//    case appleWatch
//    static func fromSlang(term: String) -> Device? {
//        if term == "iWatch" {
//            return .appleWatch
//        }
//        return nil
//    }
//}
//print(Device.fromSlang(term: "iWatch"))
//
//
//
//enum Direction :String{
//    case north = "北"
//    case east = "東"
//    case south = "南"
//    case west = "西"
//
//    mutating func next() {
//        switch self {
//        case .north:
//            self = .east
//        case .east:
//            self = .south
//        case .south:
//            self = .west
//        case .west:
//            self = .north
//        }
//    }
//}
//
//var direction = Direction.north
//direction.next()
//direction.rawValue //"東"
//
//
//
//protocol AccountCompatible {
//    var remainingFunds: Int { get }
//    mutating func addFunds(amount: Int) throws
//    mutating func removeFunds(amount: Int) throws
//}
//
//struct Account: AccountCompatible {
//
//    var remainingFunds: Int = 0
//
//    enum Error {
//        case overdraft(amount: Int)
//    }
//
//    mutating func addFunds(amount: Int) throws {
//        var newAmount = remainingFunds
//        newAmount += amount
//        if newAmount < 0 {
//            throw Error.overdraft(amount: -newAmount)
//        }
//        else {
//            remainingFunds = newAmount
//        }
//    }
//
//    mutating func removeFunds(amount: Int) throws {
//        try addFunds(amount: amount * -1)
//    }
//
//}
//
//
//var myAccount = Account(remainingFunds: 10000)

import Foundation

//UUID().uuidString
//UUID().uuidString
//UUID().uuidString
//UUID().uuidString
//UUID().uuidString

var name = ""

!name.isEmpty
