//: # WWDC 2021! Gokemon Reborn on Swift Playground.
//: - Create Monster: How we can play with the games.
//: - Create Enemies: Use monsters on defeating with the enemy.

//
//This Program is about console game called Gokemon
//which used backtracking algorithm
//created by Bryanza Novirahman
//@version 06-04-2021
//

import PlaygroundSupport

// Generate View
let contentView = Controller()

let window = UIWindow(frame: CGRect(x: 0,
y: 0,
width: 360,
height: 1024))
let vc = UIHostingController(rootView: contentView)
window.rootViewController = vc
window.makeKeyAndVisible()
PlaygroundPage.current.liveView = window
PlaygroundPage.current.needsIndefiniteExecution = true

