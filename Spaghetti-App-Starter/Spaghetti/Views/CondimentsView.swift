//
//  CondimentsView.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 17/01/22.
//

import SwiftUI

struct CondimentsView: View {
    
    var selectedPastaKind: PastaKind
    
    // 1. This chunk of code may belong to somewhere else 👀 --------------------------
    @State private var selectedCondiments = Set<UUID>()
    
    @State var condiments: [Condiment] = [
        Condiment(name: "Tomatoes", description: "Fresh and red as passion", emoji: "🍅"),
        Condiment(name: "Mushrooms", description: "Happiness dispensers", emoji: "🍄")
    ]
    
    @State private var otherCondiments: [Condiment] = [
        Condiment(name: "Onion", description: "It makes you cry from the excitement!", emoji: "🧅"),
        Condiment(name: "Garlic", description: "Francesco Dell'Aglio approves", emoji: "🧄"),
        Condiment(name: "Cheese", description: "When you take a picture", emoji: "🧀"),
        Condiment(name: "Egg", description: "Hens say it's debatable", emoji: "🥚")
    ]
    // --------------------------------------------------------------------------------
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                List {
                    Section(header: Text("Select your condiments".uppercased())) {
                        ForEach(self.condiments) { condiment in
                            
                            // 2. This HStack can be relocated to another View 👀 ----
                            HStack {
                                Text(condiment.emoji)
                                    .font(.system(size: 30))
                                VStack(alignment: .leading) {
                                    Text(condiment.name)
                                        .bold()
                                        .font(.system(size: 18))
                                    Text(condiment.description)
                                        .foregroundColor(.secondary)
                                        .font(.system(size: 12))
                                }
                                Spacer()
                                
                                if self.isCondimentSelected(id: condiment.id) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .frame(width: 19, height: 19)
                                        .foregroundColor(.blue)
                                }
                                
                            }
                            .background(.white)
                            .padding(10)
                            // -------------------------------------------------------
                            
                            .onTapGesture {
                                self.toggleCondimentSelection(id: condiment.id)
                            }
                        }
                    }
                }
                if self.getSelectedCondimentsNumber() != 0 {
                    NavigationLink(destination: ServedPastaView(selectedPastaKind: selectedPastaKind, selectedCondiments: self.getSelectedCondiments())) {
                        
                        // 3. This Label can be relocated to another view 👀 ---------
                        Label("Prepare", systemImage: "fork.knife")
                            .font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .mask(
                                RoundedRectangle(cornerRadius: 16)
                            )
                        // -----------------------------------------------------------
                        
                    }
                    .padding([.leading, .trailing])
                }
            }
            Text("\(self.getSelectedCondimentsNumber()) selections")
        }
        .toolbar {
            ToolbarItem {
                if self.areOtherCondimentsLeft() {
                    Button(action: self.addNewCondiment) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .navigationTitle("Condiments")
    }
    
    // 4. These functions may belong to somewhere else 👀 -----------------------------
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
    // --------------------------------------------------------------------------------
    
}


struct CondimentsView_Previews: PreviewProvider {
    static var previews: some View {
        CondimentsView(selectedPastaKind: PastaKind(name: "Spaghetti", description: "Long sticks!", imageName: "spaghetti"))
    }
}
