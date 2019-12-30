//
//  HistoryView.swift
//  Dicey
//
//  Created by Mihai Leonte on 30/12/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var rolls: Rolls
    
    var body: some View {
        List(rolls.items) { roll in
            HStack {
                Text("Rolled \(roll.diceOne + roll.diceTwo) on \(self.shortDate(from: roll.date))")
                
                Spacer()
                
                Image(systemName: "\(roll.diceOne).square")
                    .font(.headline)
                Image(systemName: "\(roll.diceTwo).square")
                    .font(.headline)
                Text(" / ")
                Image(systemName: "\(roll.diceMaxValue).square")
                    .font(.headline)
                Image(systemName: "\(roll.diceMaxValue).square")
                    .font(.headline)
            }
        }
    }
    
    func shortDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}
