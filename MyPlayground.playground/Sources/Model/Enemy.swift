import Foundation

// Enemies Object that represent the target
class Enemy {
    
    // Instance Variable
    
    private var element: Character = ""
    private var stamina: Int = 0
    private var count: Int = 0
    
    // Constructor to initialize number of trainer in the beginning
    init(count: Int) {
        self.count = count
    }
    
    // Constructor to insert the enemy object trainer into the map
    init(element: Character) {
        self.element = element
    }
    
    // Setter / Getter Method
    
    func getCount() -> Int {
        return self.count
    }
    
    func getElement() -> Character {
        return self.element
    }
    
    func getStamina() -> Int {
        return self.stamina
    }
    
    func setCount(count: Int) {
        self.count = count
    }
    
}
