import Foundation

// Monsters Object that represent the collection
class Monster {
    
    // Instance Variable
    
    private var name: String = ""
    private var element: Character = ""
    private var stamina: Int = 0
    private var variant: Int = 0
    private var order: Int = 0
    
    // Constructor to initialize number of trainer in the beginning
    init(variant: Int) {
        self.variant = variant
    }

    // Constructor to insert the Gokemon monster object
    init(name: String, element: Character, stamina: Int, order: Int) {
        self.name = name
        self.element = element
        self.stamina = stamina
        self.order = order
    }
    
    // Setter / Getter method
    
    func getName() -> String {
        return self.name
    }
    
    func getElement() -> Character {
        return self.element
    }
    
    func getStamina() {
        return self.stamina
    }
    
    func getOrder() {
        return self.order
    }
    
    func getVariant() {
        return self.variant
    }
    
    func setVariant(variant: Int) {
        self.variant = variant
    }
    
    func setOrder(order: Int) {
        self.order = order
    }
    
    func setStamina(stamina: Int) {
        self.stamina = stamina
    }
    
    // Override method for supporting the comparison of the monster
    
    func compareTo(other: Monster) -> Int {
        if (self.stamina == other.getStamina()) {
            return self.order > other.getOrder() ? 1 : -1
        }
        return self.stamina > other.getStamina() ? 1 : -1
    }

}
