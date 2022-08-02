//
//  CondimentsViewModel.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 20/01/22.
//

import Foundation

class CondimentsViewModel: ObservableObject {
    
    @Published private var selectedCondiments = Set<UUID>()
    
    @Published var condiments: [Condiment] = [
        Condiment(name: "Tomatoes", description: "Fresh and red as passion", emoji: "🍅"),
        Condiment(name: "Mushrooms", description: "Happiness dispensers", emoji: "🍄")
    ]
    
    private var otherCondiments: [Condiment] = [
        Condiment(name: "Onion", description: "It makes you cry from the excitement!", emoji: "🧅"),
        Condiment(name: "Garlic", description: "Francesco Dell'Aglio approves", emoji: "🧄"),
        Condiment(name: "Cheese", description: "When you take a picture", emoji: "🧀"),
        Condiment(name: "Egg", description: "Hens say it's debatable", emoji: "🥚")
    ]
    
    func addNewCondiment() {
        guard otherCondiments.count == 0 else {
            self.condiments.append(otherCondiments.popLast()!)
            return
        }
    }
    
    func areOtherCondimentsLeft() -> Bool {
        return otherCondiments.count != 0
    }
    
    func toggleCondimentSelection(id: UUID) {
        guard selectedCondiments.contains(id) else {
            selectedCondiments.insert(id)
            return
        }
        selectedCondiments.remove(id)
    }
    
    func isCondimentSelected(id: UUID) -> Bool {
        return selectedCondiments.contains(id) ? true : false
    }
    
    func getSelectedCondiments() -> [Condiment] {
        return condiments.filter { condiment in
            selectedCondiments.contains(condiment.id)
        }
    }
    
    func getSelectedCondimentsNumber() -> Int {
        return selectedCondiments.count
    }
    
}
