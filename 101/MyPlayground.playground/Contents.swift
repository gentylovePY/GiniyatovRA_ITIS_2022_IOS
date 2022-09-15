
import UIKit
import Foundation

protocol TTXPers {
    var name : String { get }
    var HP : Int { get set }
    var MP : Int { get set }
    var damage : Int { get }
    var ability: Ability {get set}
 
}

protocol TTXMonsters {
    var nameMonsters : String { get  }
    var HPMonsters : Int { get set }
    var damageMonsters : Int { get  }
}

enum Direction:CaseIterable {
    case left
    case right
    case forward
    case backward
    case left_forward
    case right_forward
    case right_backward
    case left_backward
}

enum Ability:CaseIterable {
    case fireball
    case lightning
    case health
    case speed
}

enum AbilityMonsters:CaseIterable{
    case bigFly
    case rottenHand
    case repulsivSmell
}

enum Artifacts: CaseIterable {
    case potion
    case gun
    case boots
    
}

class Pers : TTXPers {
    
    var name : String
    var HP : Int
    var MP : Int
    var damage : Int
    var ability: Ability
    var direction : Direction? = nil
    var artifact: Artifacts? = nil
    
    
    init (name:String, HP:Int,MP:Int,damege:Int,ability:Ability){
        self.name = name
        self.HP = HP
        self.MP = MP
        self.damage = damege
        self.ability = ability
        
    }
    
  
    func infoFirstPers() -> String {
        let info = "Создался герой = \(name), HP = \(HP), MP = \(MP), Damege = \(damage), ability = \(ability)"
        
        return info
    }
    func stats() -> String {
        let info = "герой = \(name), HP = \(HP), MP = \(MP), Damege = \(damage), ability = \(ability)"
        
        return info
    }
    
    func getNameFirstPers() -> String{
        name
    }
    
    func getHpFirstPers() -> Int {
        HP
    }
    
    func getMPFirstPers() -> Int {
        MP
    }
    
    func getDirection() -> Any {
        direction as Any
    }
   
}

class Monsters : TTXMonsters {
    var nameMonsters: String
    var HPMonsters: Int
    var damageMonsters: Int
    var direction : Direction? = nil
    var abilityMonsters:AbilityMonsters
    
    init(nameMonsters:String, HPMonsters:Int,  damageMonsters:Int, abilityMonsters:AbilityMonsters){
        self.nameMonsters = nameMonsters
        self.HPMonsters = HPMonsters
        self.damageMonsters = damageMonsters
        self.abilityMonsters = abilityMonsters
    }
    
    
    func infoFirstMonsters() -> String {
        let info = "Создался монстр = \(nameMonsters), HP = \(HPMonsters), Damege = \(damageMonsters), ability = \(abilityMonsters) "
        
        return info
    }
    
    
    func stats() -> String {
        let info = " монстр  = \(nameMonsters), HP = \(HPMonsters), Damege = \(damageMonsters), ability = \(abilityMonsters) "
        
        return info
    }
    
    func getNameMonsters() -> String{
        nameMonsters
    }
    
    func getHpMonsters() -> Int {
        HPMonsters
    }
    
    func getDirectionMonsters() -> Any{
        direction as Any
    }
    
}


class CreatePersAndMonsters{
    let valuePers = Int.random(in: 2...4)
    let valueMonsters = Int.random(in: 7...9)
    var arrayPers: [Pers] = []
    var arrayMonsters: [Monsters] = []

  func create()  {
        for i in 0...valuePers-1 {
           
            let pers = Pers(name: "pers\(i)", HP: Int.random(in: 100...300), MP: Int.random(in: 20...30), damege: Int.random(in: 10...30) , ability: Ability.allCases.randomElement()!)
            print(pers.infoFirstPers())
            arrayPers.append(pers)
            
        }
      
      print("")
       
        for i in 0...valueMonsters-1{
            let monsters = Monsters(nameMonsters: "monsters\(i)", HPMonsters: Int.random(in: 130...180), damageMonsters: Int.random(in: 5...25), abilityMonsters: AbilityMonsters.allCases.randomElement()!)
           
            print(monsters.infoFirstMonsters())
            arrayMonsters.append(monsters)
        }
    
    }
    
}

class Game{
    
    func go(){
        
        let create = CreatePersAndMonsters()
        create.create()
        var deadPers: [Pers] = []
        var deadMMonsters : [Monsters] = []
        
    print("\nигра началась\n ")
    while( create.arrayMonsters.count > 1 || create.arrayPers.count > 1){
            
        for i in  0...create.arrayPers.count-1{
            let direction = Direction.allCases.randomElement()!
            print( "Герой \(create.arrayPers[i].getNameFirstPers()) пошел \( direction)")
            create.arrayPers[i].direction = direction
            let veroyatnoct = Int.random(in: 1...100)
            if(veroyatnoct <= 10){
                let artifact = Artifacts.allCases.randomElement()!
                create.arrayPers[i].artifact = artifact
                print("Герой \(create.arrayPers[i].getNameFirstPers()) нашел \(artifact)!!!!")
            }
            
        }
            print("")
        
        for i in  0...create.arrayMonsters.count-1{
            let direction = Direction.allCases.randomElement()!
            print( " герой \(create.arrayMonsters[i].getNameMonsters()) пошел \( direction)")
            create.arrayMonsters[i].direction = direction
        }
        
            print("")
            
        for i in 0...create.arrayPers.count-2{
           
            if(create.arrayMonsters.count > 1 && create.arrayPers.count > 1){
            for j in 0...create.arrayMonsters.count-2{
        
                if(create.arrayPers[i].direction == create.arrayMonsters[j].direction){
                    
              
                    print("ПРОИЗОШЕЛ БОЙ МЕЖДУ  \(create.arrayPers[i].getNameFirstPers()) и \(create.arrayMonsters[j].getNameMonsters())")
                    print("")
                    
                    if(  create.arrayPers[i].MP < 2) {
                        print("У героя \(create.arrayPers[i].name) недостаточно MP, он провалил атаку\n")
                        create.arrayPers[i].HP -= create.arrayMonsters[j].damageMonsters
                        create.arrayPers[i].MP += (((create.arrayPers[i].MP) * (-1)) * 2)
                        print("У героя \(create.arrayPers[i].name) пополнилась  MP, его МР = \(create.arrayPers[i].MP)\n")
                        
                    } else{
                        create.arrayPers[i].HP -= create.arrayMonsters[j].damageMonsters
                        create.arrayMonsters[j].HPMonsters -= create.arrayPers[i].damage
                        create.arrayPers[i].MP -= create.arrayPers[i].HP / (create.arrayPers[i].MP)
                    }
                    
                    print("статистика:  \(create.arrayPers[i].stats()) и \n \(create.arrayMonsters[j].stats())\n")
                    
                    
                    if(create.arrayPers[i].HP <= 0){
                        print("---умер--- \(create.arrayPers[i].name)\n")
                        create.arrayPers.remove(at: i)
                        deadPers.append(create.arrayPers[i])
                      
                    }
                    if(create.arrayMonsters[j].HPMonsters <= 0){
                        print("---умер--- \(create.arrayMonsters[j].nameMonsters)\n")
                        create.arrayMonsters.remove(at: j)
                        deadMMonsters.append(create.arrayMonsters[i])
                       
                    }
                }
            }
        }
}
            if(create.arrayPers.count <= 1){
                print("Последний персонаж сбежал с поля битвы, один в поле не воин")
                print("Игра закончилась")
                
                break
            }
            if(create.arrayMonsters.count <= 1){
                print("Последний монстр сбежал с поля битвы, один в поле не воин")
                print("Игра закончилась")
                
                break
            }
    }

  }

 }


var game = Game()
game.go()


