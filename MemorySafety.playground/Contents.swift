import UIKit

// conflicting access to in-out parameters

var stepSize = 1

func increment(value: inout Int) {
    return value += stepSize
}

// Simultaneous accesses to 0x118752520, but modification requires exclusive access.
// increment(value: &stepSize)

var copyOfStepSize = stepSize
increment(value: &copyOfStepSize)

print(copyOfStepSize)

// conflicting access to self in methods

func balance(_ x: inout Int, _ y: inout Int) {
       let sum = x + y
       
       x = sum / 2
       y = sum - x
   }

struct Player {
    var health = 0
    var energy = 0
    
    mutating func shareHealth(player: inout Player) {
        balance(&self.health, &player.health)
    }
}

var player1 = Player()
var player2 = Player()

player1.shareHealth(player: &player2)

// compile-time error
// player1.shareHealth(player: &player1)

// conflicting access to properties

var playerInfo = (health: 10, energy: 20)

// Simultaneous accesses to 0x1095e66d0, but modification requires exclusive access.
// balance(x: &playerInfo.health, y: &playerInfo.energy)

var holly = Player(health: 10, energy: 10)

// Simultaneous accesses to 0x10aa207c0, but modification requires exclusive access.
// balance(&holly.health, &holly.energy)

func someFunction() {
    var oscar = Player(health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)
}

someFunction()
