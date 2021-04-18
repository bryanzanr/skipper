import Foundation

// Class that contrains the map of target trainer
class Target {
    
    // Instance Variable
    private var enemyList: [Coordinate: Enemy]
    
    // Empty Constructor for starting the map
    init() {
        self.enemyList = [Coordinate: Enemy]()
    }
    
    // Method to call the map from other class
    func getList() -> [Coordinate: Enemy] {
        return self.enemyList
    }
    
    // Method to add the target trainer into the map
    func addEnemy(enemy: String) {
        var temp = enemy.split(separator: " ")
        var trainer: Coordinate = Coordinate(axis: temp[0].toInt() - 1, ordinate: temp[1].toInt() - 1)
        var target: Enemy = Enemy(count: temp[2][0])
        if self.enemyList[trainer] == nil {
            self.enemyList[trainer] = target
        }
    }
    
}
