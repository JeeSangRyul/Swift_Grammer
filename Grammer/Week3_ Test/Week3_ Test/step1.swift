//
//  step1.swift
//  Week3_ Test
//
//  Created by 지상률 on 2022/11/30.
//

import Foundation

class PersonA {
    var name : String
    var age : Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func buyStuff() {
        print("물건을 구매했습니다.")
    }
}

class CustomerA: PersonA {
    var money: Int
    
    override init(name: String, age: Int) {
        self.money = 50000
        super.init(name: name, age: age)
    }
    
    var cafe: CoffeeShopA?
}

class Barista: PersonA {
    var cafe: CoffeeShopA?
}

class CoffeeShopA {
    enum Coffee : Int{
        case CafeLatte
        case Americano
        case Cake
        
        func printCoffeePrice() -> Int {
            switch self{
            case .Americano:
                return 4500
            case .CafeLatte:
                return 5000
            case .Cake:
                return 5500
            }
        }
    }
    
    var name : String
    var revenue : Int
    var pickUpTable : Bool
    var customer : CustomerA
    var barista : Barista
    
    init(name: String, revenue: Int, pickUpTable: Bool, customer: CustomerA, barista: Barista) {
        self.name = name
        self.revenue = revenue
        self.pickUpTable = pickUpTable
        self.customer = customer
        self.barista = barista
    }
    
    func order(cafe: Coffee) {
        let costMoney = cafe.printCoffeePrice()
        if customer.money - costMoney < 0 {
            print("잔액이 \(costMoney - customer.money)원 만큼 부족합니다.")
        }else{
            customer.money = customer.money - costMoney
            self.revenue = self.revenue + costMoney
            barista.cafe?.pickUpTable = true
            print("\(customer.name)님의 커피가 준비되었습니다. 픽업대에서 가져가주세요")
        }
        
        
    }
}
