import Foundation

// Class collection that contrains the map of monster object
class Collection {
    
    // Instance Variable
    
    private var dataMonster: [String: Monster]
    private var priorityQueue: [Monster]
    
    var limitMonster: Int = 0
    
    // Constructor for first initialization 
    init(limitMonster: Int) {
        this.limitMonster = limitMonster
    }
    
    // Empty constructor for instantiate the map
    init() {
        self.dataMonster = [String: Monster]()
    }
    
    // Method to insert the "Pokemon" monster into the map
    func meetMonster(other: [Monster]) -> [Monster] {
        
        // Calling the abstract data type (ADT) to accomodate the gokemons that are currently carried
        var new = [Monster]()
        
        if other.isEmpty == false {
            for i in 0..<other.count {
                // Insert the "Pokemon" into the map while decreasing the number of gokemons that are carried
                self.dataMonster[other[i].getName()] = other[i]
                self.limitMonster -= 1
            }
        }
        
        // Calling the method to check whether it's needed or not to free the Gokemon monster
        self.freeMonster()
        
        // Inserting the "Pokemon" monster into the one that already filtered by limit
        // into the abstract data type (ADT) for be returned and printed into the next method
        for i in 0..<other.count {
            if dataMonster[other[i].getName()] != nil {
                new.append(other[i])
            }
        }
        
        return new
        
    }
    
    // Method to check whether it's needed or not to free the gokemon and if needed then it will be free
    func freeMonster() {
        
        // It's released based on the priority queue that compare using the method in "Pokemon" monster
        self.priorityQueue = [Monster]()
        for k,v in self.dataMonster {
            self.priorityQueue.append(v)
        }
        
        
        
//        if self.limitMonster < 0 {
//            self.dataMonster.removeValue(forKey: self.priorityQueue[self.priorityQueue.count - 1].getName())
//            self.limitMonster += 1
//        }
        
        for i in (0..<self.priorityQueue.count).reversed() {
            if self.limitMonster >= 0 {
                break
            }
            
            // While increasing the limit so that it can be added at the same time
            self.dataMonster.removeValue(forKey: self.priorityQueue[i].getName())
            self.limitMonster += 1
            
        }
        
    }

    func prioritisedMonster(other: Enemy) -> Monster {
        var fire: Monster = nil
        var water: Monster = nil
        var grass: Monster = nil
        
        // Echanced loop for finding the gokemon omnster that most fit
        // to battle using the compare method based on priority
        for k,v in self.dataMonster {
            if v.getElement() == "F" && (fire == null || fire.compareTo(other: v) > 0) {
                fire = v
            }else if v.getElement() == "W" && (water == null || water.compareTo(other: v) > 0) {
                water = v
            }else if v.getElement() == "G" && (grass == null || grass.compareTo(other: v) > 0) {
                grass = v
            }
        }
        
        // Finding the most suitable based on element
        var max: Monster = nil
        if other.getElement() == "F" {
            max = water
            if max == nil {
                max = fire
                if max == nil {
                    max = grass
                }
            }
        }else if other.getElement() == "W" {
            max = grass
            if max == nil {
                max = water
                if max == nil {
                    max = fire
                }
            }
        }else if other.getElement() == "G" {
            max = fire
            if max == nil {
                max = grass
                if max == nil {
                    max = water
                }
            }
        }
        
        // Remove the monster from the map after battle
        if max != nil {
            self.dataMonster.removeValue(forKey: max.getName())
            self.limitMonster += 1
        }
        return max
    }
    
    // Method to return the monster after the program is finished
    func returnMonster() -> String {
        if self.dataMonster.isEmpty {
            return "NO GHOKEMON LEFT\n"
        }else {
            var temp: String = "GHOKEMON LEFT:\n"
            // Set all the stamina into 0 first so that it will not sorted by it
            for k,v in self.dataMonster {
                v.setStamina(0)
            }
            // Calling the abstract data type (ADT) to sorting the map
            self.priorityQueue = [Monster]()
            for k,v in self.dataMonster {
                self.priorityQueue.append(v)
            }
            for i in (0..<self.priorityQueue.count).reversed() {
                temp += self.priorityQueue[i].getName() + "\n"
            }
            return temp
        }
    }
    
}
