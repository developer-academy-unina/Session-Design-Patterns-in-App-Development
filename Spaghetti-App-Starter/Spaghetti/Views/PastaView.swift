//
//  PastaView.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 13/01/22.
//

import SwiftUI

struct PastaView: View {
    
    // 1. You may thing to relocate the Grid to another view 👀 -----------------------
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    // --------------------------------------------------------------------------------
    
    
    // 2. This chunk of code may belong to somewhere else 👀 --------------------------
    @State var pastaKinds: [PastaKind] = [
        PastaKind(name: "Spaghetti", description: "Spaghet-it, won't regret it", imageName: "spaghetti"),
        PastaKind(name: "Fusilli", description: "Every curl is a whim", imageName: "fusilli"),
        PastaKind(name: "Farfalle", description: "Flying from dish to mouth", imageName: "farfalle")
    ]
    
    @State private var otherPastaKinds: [PastaKind] = [
        PastaKind(name: "Rigatoni", description: "The ex's revenge", imageName: "rigatoni"),
        PastaKind(name: "Penne", description: "Tasty but don't write", imageName: "penne"),
        PastaKind(name: "Macaroni", description: "They stick to the pot", imageName: "macaroni")
    ]
    // --------------------------------------------------------------------------------
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                // 3. This Lazy Grid can be relocated to another view 👀 --------------
                LazyVGrid(columns: columns, spacing: 15, pinnedViews: [.sectionHeaders]) {
                    Section(header: Text("Select your favourite pasta".uppercased())
                                .font(.system(size: 13))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.white.opacity(0.9))
                                .foregroundColor(.secondary)
                    ) {
                        ForEach(self.pastaKinds) { pastaKind in
                            NavigationLink(destination: CondimentsView(selectedPastaKind: pastaKind)) {
                                
                                /// 3.1 This part can also be relocated to another view 👀 -------------------
                                VStack(alignment: .leading) {
                                    ZStack(alignment: .bottomTrailing) {
                                        pastaKind.image
                                            .resizable()
                                            .frame(minWidth: 17.3, maxWidth: 173, minHeight: 15.5, maxHeight: 155)
                                            .cornerRadius(5)
                                    }
                                    Text(pastaKind.name)
                                        .bold()
                                        .font(.system(size: 16))
                                        .foregroundColor(.primary)
                                    Text(pastaKind.description)
                                        .font(.system(size: 13))
                                        .foregroundColor(Color(uiColor: .systemGray))
                                }
                                /// --------------------------------------------------
                                
                            }
                        }
                    }
                }
                .padding([.leading, .trailing], 18)
                // ---------------------------------------------------------------------
                
            }
            .toolbar {
                ToolbarItem {
                    if self.areOtherPastaKindsLeft() {
                        Button(action: self.addNewPastaKind) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .navigationTitle("Pasta")
        }
    }
    
    // 4. These functions may belong to somewhere else 👀 -----------------------------
    func addNewPastaKind() {
        guard otherPastaKinds.count == 0 else {
            self.pastaKinds.append(otherPastaKinds.popLast()!)
            return
        }
    }
    
    func areOtherPastaKindsLeft() -> Bool {
        return otherPastaKinds.count != 0
    }
    // --------------------------------------------------------------------------------
    
}


struct PastaView_Previews: PreviewProvider {
    static var previews: some View {
        PastaView()
    }
}
