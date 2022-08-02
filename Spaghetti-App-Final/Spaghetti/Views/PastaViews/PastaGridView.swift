//
//  PastaGridView.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 15/01/22.
//

import SwiftUI

struct PastaGridView: View {
    
    var pastaKinds: [PastaKind]
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15, pinnedViews: [.sectionHeaders]) {
            Section(header: PastaHeaderView()) {
                ForEach(pastaKinds) { pastaKind in
                    NavigationLink(destination: CondimentsView(selectedPastaKind: pastaKind)) {
                        PastaKindView(pastaKindImage: pastaKind.image, pastaKindName: pastaKind.name, pastaKindDescription: pastaKind.description)
                    }
                }
            }
        }
        .padding([.leading, .trailing], 18)
    }
}


struct PastaGridView_Previews: PreviewProvider {
    static var previews: some View {
        PastaGridView(pastaKinds: [
            PastaKind(name: "Spaghetti", description: "Spaghet-it, won't regret it", imageName: "spaghetti"),
            PastaKind(name: "Fusilli", description: "Every curl is a whim", imageName: "fusilli"),
            PastaKind(name: "Farfalle", description: "Flying from dish to mouth", imageName: "farfalle"),
            PastaKind(name: "Rigatoni", description: "The ex's revenge", imageName: "rigatoni")
        ])
    }
}
