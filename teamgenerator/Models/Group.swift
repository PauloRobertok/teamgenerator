//
//  Group.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 18/05/26.
//

import Foundation

enum SportType: String, Codable, CaseIterable {
    case volleyball = "Volleyball"
    case futsal     = "Futsal"
    case basketball = "Basketball"
    case custom     = "Custom"
    
    var icon: String {
        switch self {
        case .volleyball:  return "volleyball"
        case .futsal:      return "soccerball"
        case .basketball:  return "basketball"
        case .custom:      return "sportscourt"
        }
    }
    
    var label: String {
        switch self {
        case .volleyball:  return "Vôlei"
        case .futsal:      return "Futsal"
        case .basketball:  return "Basquete"
        case .custom:      return "Personalizado"
        }
    }
}

struct Group: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var sport: SportType
    var players: [Player]
    var minWomenPerTeam: Int = 1
    var createdAt: Date = Date()
}
