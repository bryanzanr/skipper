import Foundation
import SwiftUI

// Class World that control the run of recursive backtracking
class World {
    
    // Instance Variable
    
    private var map: [[Character]]
    private var totalArray: Int
    private var monsterDuration: Int
    private var specialReverse: Bool
    private var worldMonster: [Coordinate : [Monster]]
    private var new: [Monster]
    private var monsterList: Collection
    private var enemyCollection: Target
    private var location: Coordinate
    
    private var output: String = ""
    
    // Constructor to insert the array of string to the array of character
    init(arr: [String]) {
        self.totalArray = arr.count
        self.map = [[Character]]()
        for i in 0..<self.totalArray {
            self.map[i] = [Character]()
        }
        
        // Loop to change into the array of character and find the starting point
        for i in 0..<self.totalArray {
            // Convert into two dimensional array
            for j in 0..<arr[i].count {
                self.map[i].append(arr[i][j])
            }
            // Finding the starting point
            if self.location == nil {
                let pos = arr[i].index(of: "L")
                if pos >= 0 {
                    self.location = Coordinate(axis: i, ordinate: pos)
                    self.map[i][pos] = "#"
                }
            }
        }
        
        // Initialised object from instance variable
        self.worldMonster = [Coordinate : [Monster]]()
        self.monsterList = Collection()
        self.enemyCollection = Target()
        self.specialReverse = false
    }
    
    // Setter / Getter method
    
    func getEnemyCollection() -> Target {
        return self.enemyCollection
    }
    
    func setPriority(priority: Bool) {
        self.specialReverse = priority
    }
    
    // Method to provide the "Pokemon" in the beginning before inserted into the map in the other classes
    func addWorldMonster(pokemonProvider: String) {
        var pokemonDivider: [String] = pokemonProvider.split(separator: " ")
        var natureMonster: Coordinate = Coordinate(axis: pokemonDivider[0].toInt() - 1, ordinate: pokemonDivider[1].toInt() - 1)
        var nature: Monster = Monster(name: pokemonDivider[2], element: pokemonDivider[3][0], stamina: pokemonDivider[4].toInt(), order: 0)
        if self.worldMonster[natureMonster] == nil {
            self.worldMonster[natureMonster] = [Monster]()
        }
        self.worldMonster[natureMonster]?.append(nature)
    }
    
    // Public driver method to run the recursive helper
    func run() -> Bool {
        var found: Bool = true
        var p: Coordinate = self.location
        
        while self.isValidCoordinate(p: p.north()) || self.isValidCoordinate(p: p.east()) || self.isValidCoordinate(p: p.west()) || self.isValidCoordinate(p: p.south()) {
            if self.specialReverse == false {
                found = run(p: p.north()) || run(p: p.east()) || run(p: p.south()) || run(p: p.west())
            }else {
                found = run(p: p.north()) || run(p: p.west()) || run(p: p.south()) || run(p: p.east())
            }
        }
        // Calling the method that state the program is already finished
        self.theEnd()
        return found
    }
    
    // Private recursive helper method to run the backtracking based on priority
    private func run(p: Coordinate) -> Bool {
        // Check whether it can be passed or not
        if self.isValidCoordinate(p: p) == false {
            // if not, then backtrack one step
            return false
        }else {
            // Switch case for checking the point type that is currently passed
            switch self.map[p.getAxis()][p.getOrdinate()] {
            case "?":
                self.setPriority(priority: !self.specialReverse)
                break
            case "T":
                self.battleTrainer(point: p)
                break
            case "G":
                self.wildGokemon(point: p)
                break
            default:
                break
            }
            
            // Marking so that it will not be passed again
            self.map[p.getAxis()][p.getOrdinate()] = "#"
            var found: Bool = true
            
            while self.isValidCoordinate(p: p.north()) || self.isValidCoordinate(p: p.east()) || self.isValidCoordinate(p: p.west()) || self.isValidCoordinate(p: p.south()) {
                // Check whether there's a changed of priority or not (PSP3)
                if self.specialReverse == false {
                    found = run(p: p.north()) || run(p: p.east()) || run(p: p.south()) || run(p: p.west())
                }else {
                    found = run(p: p.north()) || run(p: p.west()) || run(p: p.south()) || run(p: p.east())
                }
            }
            
            return found
            
        }
    }
    
    // Method to check whether a point can be passed or not
    func isValidCoordinate(p: Coordinate) -> Bool {
        return p.getAxis() >= 0 && p.getOrdinate() >= 0 && p.getAxis() < self.map.count && p.getOrdinate() < self.map[p.getAxis()].count && self.map[p.getAxis()][p.getOrdinate()] != "#"
    }
    
    // Method when found a wild gokemon monster that will followed us to print the output
    func wildGokemon(point: Coordinate) {
        var temp: String = ""
        if self.worldMonster[point] != nil {
            // Calling the list that is gathered from the map class of monster
            self.new = self.monsterList.meetMonster(other: self.worldMonster[point])
            
            if self.new.isEmpty == false {
                temp += "FOLLOW " + (point.getAxis() + 1) + " " + (point.getOrdinate() + 1) + ": "
                for i in 0..<self.new.count - 1 {
                    temp += self.new[i].getName() + ", "
                    self.new[i].setOrder(self.monsterDuration += 1)
                }
                temp += self.new[self.new.count - 1].getName()
                self.new[self.new.count - 1].setOrder(self.monsterDuration += 1)
            }else {
                temp += "ALL STAY " + (point.getAxis() + 1) + " " + (point.getOrdinate() + 1)
            }
        }
        self.output += temp + "\n"
    }
    
    // Method to print the output when meeting with enemy trainer
    func battleTrainer(point: Coordinate) {
        var temp: String = ""
        // Initialised according to the point that is passed
        var picked: Monster = nil
        var enemy: Enemy = self.enemyCollection.getList()[point]
        // Finding the appropriate output to fight with the target trainer
        if self.enemyCollection.getList().isEmpty() == false {
            picked = self.listMonster.prioritisedMonster(enemy)
        }
        // If there's no "Pokemon" that can fight the target enemy
        if picked == nil  {
            temp += "NO BATTLE "
        }else {
            temp += "BATTLE " + picked.getName() + " "
        }
        temp += (point.getAxis() + 1) + " " (point.getOrdinate() + 1) + "\n"
        self.output += temp
    }
    
    // Method to print the last output when the program is finished
    func theEnd() {
        let str = self.monsterList.returnMonster()
        self.output += str
    }
}
