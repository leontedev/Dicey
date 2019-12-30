//
//  ContentView.swift
//  Dicey
//
//  Created by Mihai Leonte on 30/12/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var rolls = Rolls()
    
    var body: some View {
        TabView {
            RollView(rolls: self.rolls)
                .tabItem {
                    Image(systemName: "hexagon")
                    Text("Roll")
                }
            
            HistoryView(rolls: self.rolls)
                .tabItem {
                    Image(systemName: "clock")
                    Text("Results")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
