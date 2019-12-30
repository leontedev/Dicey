//
//  RollResults.swift
//  Dicey
//
//  Created by Mihai Leonte on 30/12/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import Foundation

class Rolls: ObservableObject {
    @Published var items: [Roll] {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(items) {
                UserDefaults.standard.set(data, forKey: "Items")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Roll].self, from: data) {
                items = decodedData
                return
            }
        }
        items = []
    }
    
}

class Roll: Identifiable, Codable {
    var id = UUID()
    var diceOne: Int
    var diceTwo: Int
    var diceMaxValue: Int
    var date = Date()
    
    init(diceOne: Int, diceTwo: Int, diceMaxValue: Int) {
        self.diceOne = diceOne
        self.diceTwo = diceTwo
        self.diceMaxValue = diceMaxValue
    }
}
