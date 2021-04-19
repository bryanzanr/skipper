# skipper

## Gokemon Reborn on Swift Playground for WWDC 2021
## Swift Student Challenge

## How the Applications Work

The application is a simple "Pokemon" look-alike scenario application. The assumptions that has been made are as follows:

1. The application is initially a console-based application which can only be executed from the terminal. 2. It was created almost five years ago in Java programming language for one of the final project in Data Structure & Algorithm course. 
3. I really like to see my old program or source code and try to modify it in order to give some improvements or at least giving it some sort of user interface (UI) in Swift programming language. 
4. Without any parameters means the application will run with default value. 
5. The parameter is inserted through many kinds of simple user's input. 
6. Choice of action will be calculated based on those parameters. 
7. The monster's name will be inserted by the user through program using FCFS (First-Come-First-Serve). 
8. The coordinates is zero indexed because of an array. 
9. Stamina can be modified only by changing the parameter called from main method (hard coded). 
10. Go to east means move 1 level below and go to west means move 1 level above (x / rows / axis). 
11. Nearest trainer means have smallest unit of distance (straight line algorithm). 
12. Gokemon's coordinates must be entered correctly in form of integer. 
13. There're at least 1 player for allowed to make the program running. 
14. Route from player's position to enemy's position is not included. 
15. Collumns (ordinate) will have more priority routes than rows (axis). 
16. Only Gokemon that have a name. 
17. Every new run of application will remove the history (no state of the game is saved). 

More detailed information can be found on the program source code.

Design Decision:
* Create main program (MyPlayground.playground) which basically only like the Playground Book Cover or Title.
* Create a Controller.swift that processed every input and generate output.   
* Create object (class of model) which consist of coordinate, enemy, and monster.
* Create base map or world (Grid Class) which represented as rows (X) and collumn (Y) from the coordinate model.  
* The distance will be generated using Manhattan's Distance Algorithm. 
* Nearest trainer or enemy will be generated using Straight Lines Distance Algorithm. 
* Every variable is done in Pastel and Camel case. 
* User or player always automatically inserted as the first point of coordinate Object (Index 0). 
* Only 1 flow can be run per execution because the program will automatically terminate if every point have already been discovered. 
* Trainers and player position cannot be in the same coordinates or positions. 
* The execution's history will be appended during the run and reset if the program exited. 
* History is shown in form of list and route is hidden to minimalize the output. 
* Type of action can be shown through input parameter. 
* String in command will be converted as zero in integer. 
* When already inserting the execution's argument, output will only appear if the execution is finished. 

## Getting Started (How to Run the Program)

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites (How the program was set up)

1. Navigate to the directory where is the root of this project folder (.playground files).
2. Still in the directory where is the root of this project, run the app by click the play button in the files.

    Most of the source code are stored in `Sources/` as well as `MyPlayground.playground` and resources (if any) are stored in `Resources/`. 

3. The app is now running! To check that the app is actually running,
try to send an action like setting up the size, coordinates, etc.

### Installing (How the program was run)

1. Make sure you already installed the latest Xcode.
2. You can also run through Swift Playground.
3. For more information you can contact me through e-mail on indonesianproduction@gmail.com.

## Built With

* [Swift Playground](https://www.apple.com/swift/playgrounds/) - Swift Playground 3.4.1 (iPadOS 14.4.2)
* [Xcode](https://developer.apple.com/xcode/) - Xcode 12.4 (MacOS 11.2.3)

## Authors

* **Bryanza Novirahman** - *Apple Developer Academy Alumni | Indonesia* - [LinkedIn](https://www.linkedin.com/in/bryanza-novirahman-902a94131)

## Important links
* [WWDC21](https://developer.apple.com/wwdc21/swift-student-challenge/)
