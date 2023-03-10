//
//  Section.swift
//  Pills
//
//  Created by Nikita  on 3/10/23.
//

import Foundation

enum Section: Int, CaseIterable {
    case info
    case vaccinatedView
    case main
    
    func getSize() -> (CGFloat, CGFloat) {
        switch self {
            case .info: return (327, 126)
            case .vaccinatedView: return (327, 101)
            case .main: return (327, 100)
        }
    }
}
