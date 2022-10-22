//
//  Model.swift
//  hw6
//
//  Created by Роман Гиниятов on 21.10.2022.
//



enum oC: String{
    case android = "Android"
    case iOS = "IOS"
}

enum nameCompany: String{
    case samsung = "Samsung"
    case apple = "Apple"
    case xiaomi = "Xiaomi"
    case poco = "Poco"
    case lenovo = "Lenovo"
}

struct Phone{
    var oC: oC
    var nameCompany: nameCompany
    var model: String
    var memory: Int
    var price:Int
    var screenSize:Float
}


struct Data{
    
    static func getAndroidPhone() -> [Phone]{
        let androidPhone: [Phone] = [
            Phone(oC: .android, nameCompany: .lenovo, model: "P750", memory: 32, price: 10000, screenSize: 6.2),
            Phone(oC: .android, nameCompany: .poco, model: "X50", memory: 32, price: 17000, screenSize: 5.2),
            Phone(oC: .android, nameCompany: .samsung, model: "A32", memory: 64, price: 32000, screenSize: 5.7),
            Phone(oC: .android, nameCompany: .poco, model: "X60", memory: 128, price: 15000, screenSize: 6.7),
            Phone(oC: .android, nameCompany: .xiaomi, model: "MI6", memory: 258, price: 25000, screenSize: 4.2),
            Phone(oC: .android, nameCompany: .xiaomi, model: "MI8", memory: 128, price: 30000, screenSize: 5.6)
        ]
        return androidPhone
    }
    
    static func getApplePhone() -> [Phone]{
        let applePhone: [Phone] = [
            Phone(oC: .iOS, nameCompany: .apple, model: "iPhone 8 plus", memory: 32, price: 32000, screenSize: 5.7),
            Phone(oC: .iOS, nameCompany: .apple, model: "iPhone 7 plus", memory: 32, price: 22000, screenSize: 5.2),
            Phone(oC: .iOS, nameCompany: .apple, model: "iPhone X", memory: 64, price: 52000, screenSize: 5.4),
            Phone(oC: .iOS, nameCompany: .apple, model: "iPhone XS", memory: 64, price: 55000, screenSize: 5.4),
            Phone(oC: .iOS, nameCompany: .apple, model: "iPhone 11", memory: 32, price: 32000, screenSize: 5.7),
            Phone(oC: .iOS, nameCompany: .apple, model: "iPhone 11 pro", memory: 64, price: 89000, screenSize: 5.7),
            Phone(oC: .iOS, nameCompany: .apple, model: "iPhone 12 pro", memory: 128, price: 87000, screenSize: 5.7),
            Phone(oC: .iOS, nameCompany: .apple, model: "iPhone 13 pro", memory: 128, price: 94000, screenSize: 5.4),
            Phone(oC: .iOS, nameCompany: .apple, model: "iPhone 14 pro", memory: 128, price: 132000, screenSize: 5.2),
            Phone(oC: .iOS, nameCompany: .apple, model: "iPhone SE", memory: 64, price: 30000, screenSize: 4.7),
            Phone(oC: .iOS, nameCompany: .apple, model: "iPhone 11", memory: 64, price: 42000, screenSize: 5.2),
            Phone(oC: .iOS, nameCompany: .apple, model: "iPhone 12", memory: 64, price: 50000, screenSize: 5.2),
        ]
        return applePhone
    }
    
}


