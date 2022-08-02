//
//  PastaViewModel.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 13/01/22.
//

import Foundation

class PastaViewModel: ObservableObject {
    
    @Published var pastaKinds: [PastaKind] = [
        PastaKind(name: "Spaghetti", description: "Spaghet-it, won't regret it", imageName: "spaghetti"),
        PastaKind(name: "Fusilli", description: "Every curl is a whim", imageName: "fusilli"),
        PastaKind(name: "Farfalle", description: "Flying from dish to mouth", imageName: "farfalle")
    ]
    
    private var otherPastaKinds: [PastaKind] = [
        PastaKind(name: "Rigatoni", description: "The ex's revenge", imageName: "rigatoni"),
        PastaKind(name: "Penne", description: "Tasty but don't write", imageName: "penne"),
        PastaKind(name: "Macaroni", description: "They stick to the pot", imageName: "macaroni")
    ]
    
    
    func addNewPastaKind() {
        guard otherPastaKinds.count == 0 else {
            self.pastaKinds.append(otherPastaKinds.popLast()!)
            return
        }
    }
    
    func areOtherPastaKindsLeft() -> Bool {
        return otherPastaKinds.count != 0
    }
    
}
