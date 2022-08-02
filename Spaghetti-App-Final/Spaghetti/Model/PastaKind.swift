//
//  PastaKind.swift
//  Spaghetti
//
//  Created by Luca Palmese for the Developer Academy on 13/01/22.
//

import Foundation
import SwiftUI

struct PastaKind: Identifiable {
    
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
}
