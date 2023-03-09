//
//  Item.swift
//  Pills
//
//  Created by Nikita  on 3/10/23.
//

import Foundation


enum ItemViews {
    case infoView
    case vaccination
    case pill(Pill)
}
class Item: Hashable, Equatable {
    var itemView: ItemViews
    var id: String = UUID().uuidString
    init(itemView: ItemViews) {
        self.itemView = itemView
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
    
}


