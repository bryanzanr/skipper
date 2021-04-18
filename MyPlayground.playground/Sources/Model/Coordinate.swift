import Foundation

// Coordinates Object that become the map representation of the world
class Coordinate: Hashable{
    
    
    // Instance Variable
    
    private var axis: Int = 0
    private var ordinate: Int = 0
    
    // Constructor to call every point that is run
    init(axis: Int, ordinate: Int) {
        self.axis = axis
        self.ordinate = ordinate
    }
    
    // Setter / Getter method
    
    func getAxis() -> Int {
        return self.axis
    }
    
    func getOrdinate() -> Int {
        return self.ordinate
    }
    
    // Method to run the pointer
    
    func north() -> Coordinate {
        let temp = Coordinate()
        temp.axis = self.axis
        temp.ordinate = self.ordinate - 1
        return temp
    }
    
    func south() -> Coordinate {
        let temp = Coordinate()
        temp.axis = self.axis
        temp.ordinate = self.ordinate + 1
        return temp
    }
    
    func west() -> Coordinate {
        let temp = Coordinate()
        temp.axis = self.axis - 1
        temp.ordinate = self.ordinate
        return temp
    }
    
    func east() -> Coordinate {
        let temp = Coordinate()
        temp.axis = self.axis + 1
        temp.ordinate = self.ordinate
        return temp
    }
    
    // Kind of override method that can support the focused of the functionalities (specialised the value and comparing the key during the hashing process)
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.axis)
        hasher.combine(self.ordinate)
    }
    
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hashCode() -> Int {
        return (self.axis + "," + self.ordinate).hashValue
    }
    
    func equals(other: NSObject) -> Bool {
        if let second = other as? Coordinate {
            return (self.axis == second.getAxis() && self.ordinate == second.getOrdinate())
        }else {
             return false
        }
    }
    
}
