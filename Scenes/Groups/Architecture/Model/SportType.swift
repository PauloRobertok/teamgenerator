//
//  SportType.swift
//  teamgenerator
//
//  Created by Ravi navarro on 30/05/26.
//

import SwiftUI

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
    
    var color: Color {
        switch self {
        case .volleyball:  return Color(red: 1.0, green: 0.6, blue: 0.2)  // Laranja
        case .futsal:      return Color(red: 0.2, green: 0.8, blue: 0.4)  // Verde
        case .basketball:  return Color(red: 1.0, green: 0.3, blue: 0.5)  // Rosa
        case .custom:      return Color(red: 0.5, green: 0.5, blue: 0.8)  // Azul
        }
    }
}
