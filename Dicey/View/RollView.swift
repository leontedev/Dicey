//
//  RollView.swift
//  Dicey
//
//  Created by Mihai Leonte on 30/12/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct RollView: View {
    @State private var diceOne: Int = 0
    @State private var diceTwo: Int = 0
    var diceTypes = ["d6", "d10", "d12", "d20"]
    var diceMaxValues = [6, 10, 12, 20]
    @State private var selectedDiceType: Int = 0
    @ObservedObject var rolls: Rolls
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Picker(selection: self.$selectedDiceType, label: Text("Dice Type")) {
                    ForEach(0 ..< self.diceTypes.count) {
                        Text("\(self.diceTypes[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(maxWidth: proxy.size.width * 0.8)
                .padding()
                
                HStack {
                    if self.diceOne == 0 {
                        Image(systemName: "questionmark.square")
                            .font(.largeTitle)
                            .padding()
                        
                        Image(systemName: "questionmark.square")
                            .font(.largeTitle)
                            .padding()
                    } else {
                        Image(systemName: "\(self.diceOne).square")
                            .font(.largeTitle)
                            .padding()
                        
                        Image(systemName: "\(self.diceTwo).square")
                            .font(.largeTitle)
                            .padding()
                    }
                }.padding()

                Text(self.diceOne == 0 ? "Roll the dice" : "You rolled \(self.diceOne + self.diceTwo) / \(self.diceMaxValues[self.selectedDiceType] * 2)")
                    .font(.headline)
                    .padding()
                
                Button(action: {
                    
                    for i in 1...10 {
                        DispatchQueue.main.asyncAfter(deadline: .now()+(0.3 / Double(i))) {
                            self.diceOne = Int.random(in: 1...self.diceMaxValues[self.selectedDiceType])
                            self.diceTwo = Int.random(in: 1...self.diceMaxValues[self.selectedDiceType])
                            
                            print(self.diceOne, self.diceTwo)
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.31) {
                        print("Saving...")
                        print(self.diceOne, self.diceTwo)
                        self.rolls.items.append(Roll(diceOne: self.diceOne, diceTwo: self.diceTwo, diceMaxValue: self.diceMaxValues[self.selectedDiceType]))
                    }
                    
                    
                }) {
                    HStack {
                        Text("Roll: ")
                        Image(systemName: "\(self.diceMaxValues[self.selectedDiceType]).square")
                        Image(systemName: "\(self.diceMaxValues[self.selectedDiceType]).square")
                    }
                    .accentColor(Color.white)
                    .frame(minWidth: 220, maxWidth: 220)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}

//struct RollView_Previews: PreviewProvider {
//    static var previews: some View {
//        RollView()
//    }
//}
