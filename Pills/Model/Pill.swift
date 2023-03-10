//
//  Pill.swift
//  Pills
//
//  Created by Nikita  on 3/10/23.
//

import Foundation

class Pill: Equatable {
  
    var id = UUID().uuidString
    var name: String
    var imageName: String
    var description: String
    
    init(name: String, imageName: String, description: String) {
        self.name = name
        self.imageName = imageName
        self.description = description
    }
    
    static func == (lhs: Pill, rhs: Pill) -> Bool {
        return lhs.id == rhs.id
    }
}
