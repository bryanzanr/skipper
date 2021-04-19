import SwiftUI

// Main Application
struct Controller: View {
    @State private var redButton = false
    @State private var step = 0
    @State private var segment = 0
    @State private var showSecret = false
    @State private var text = ""
    @State private var slide = 0.0
    @State private var isButtonVisible = false
    @State private var actionButton = false
    @State private var actionType = 0
    @State private var arrayCount = 0
    @State private var executeButton = false
    @State private var priceCount = 0

    var body: some View {
      VStack {
        Text("Welcome to Gokemon-CLI!")
          .font(.headline)
        //MARK:- Text & Stepper
        Text("Please Choose your Action")
         Stepper("Input: \(actionType)", value: $actionType, in: 0...3)
        //MARK:- Button
        Button(action: {
            self.actionButton = !self.actionButton
            self.priceCount = 0
        }, label: {
            Text("Refresh")
                .foregroundColor(.green)
        })

        self.inputView()
        .transition(.move(edge: .trailing))
        .animation(Animation.linear(duration: 2))
        self.executeView()
        .transition(.move(edge: .trailing))
        .animation(Animation.linear(duration: 2))
      }
    }
    
    // Main Features Switch
    func checkAction() -> some View {
        Group {
            if actionType == 1{
                //MARK:- Slider
                Slider(value: self.$slide, in: 1...2, step: 1)
                Stepper("Number of Monsters: \(arrayCount)", value: $arrayCount, in: 0...Int(slide))
                Text("Your Map: \(self.slide)")
            }else if actionType == 2 {
                //MARK:- Toggle
                Toggle(isOn: self.$showSecret) {
                 Text("Please Choose your Coordinates")
               }
                if !self.showSecret {
                   //MARK:- Stepper
                    Stepper("Coordinates_X: \(self.step)", value: self.$step, in: 0...Int(slide))
        
               }else{
                   //MARK:- Stepper
                    Stepper("Coordinates_Y: \(self.step)", value: self.$step, in: 0...Int(slide))
               }
                Button(action: {
                    self.executeButton = !self.executeButton
                }, label: {
                    Text("Confirm Your Game")
                        .foregroundColor(.green)
                })
            }else if actionType == 3{
                //MARK:- Text Field
                TextField("Insert your Gokemon", text: self.$text)
                if !self.text.isEmpty {Text("Your Gokemon: \(self.text)")}
            }
        }
    }
    
    // Choose Main Features
    func inputView() -> some View {
        Group {
            if actionButton {
                checkAction()
            }else{
                checkAction()
            }
        }
    }
    
    // Check Routing Features
    func executeView() -> some View {
        Group {
            if executeButton {
                run()
            }else{
                run()
            }
        }
    }
    
}
