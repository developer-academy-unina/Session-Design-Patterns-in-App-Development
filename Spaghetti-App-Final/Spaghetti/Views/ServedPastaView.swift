//
//  ServedPastaView.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 15/01/22.
//

import SwiftUI

struct ServedPastaView: View {
    
    var selectedPastaKind: PastaKind
    var selectedCondiments: [Condiment]
    
    var body: some View {
        VStack {
            ZStack {
                Image("towel")
                    .resizable()
                Image("dish")
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
                selectedPastaKind.image
                    .resizable()
                    .frame(width: 136, height: 136)
                    .aspectRatio(contentMode: .fit)
                    .mask(Circle())
                ForEach(selectedCondiments) { condiment in
                    Text(condiment.emoji)
                        .font(.system(size: 35))
                        .shadow(color: .black, radius: 5)
                        .offset(x: CGFloat.random(in: -55..<55), y: CGFloat.random(in: -55..<55))
                }
            }
        }
        .navigationTitle("Pasta is served!")
    }
}


struct ServedPastaView_Previews: PreviewProvider {
    static var previews: some View {
        ServedPastaView(selectedPastaKind: PastaKind(id: UUID(), name: "spaghetti", description: "Long sticks!", imageName: "spaghetti"), selectedCondiments: [
            Condiment(name: "Tomatoes", description: "Nice!", emoji: "🍅"),
            Condiment(name: "Mushrooms", description: "Nice!", emoji: "🍄")
        ])
    }
}
