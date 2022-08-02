//
//  CondimentRow.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 24/01/22.
//

import SwiftUI

struct CondimentRow: View {
    
    let emoji: String
    let name: String
    let description: String
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Text(emoji)
                .font(.system(size: 30))
            VStack(alignment: .leading) {
                Text(name)
                    .bold()
                    .font(.system(size: 18))
                Text(description)
                    .foregroundColor(.secondary)
                    .font(.system(size: 12))
            }
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 19, height: 19)
                    .foregroundColor(.blue)
            }
            
        }
        .background(.white)
        .padding(10)
    }
}


struct CondimentRow_Previews: PreviewProvider {
    static var previews: some View {
        CondimentRow(emoji: "🍅", name: "Tomatoes", description: "Fresh and red as passion", isSelected: true)
    }
}
