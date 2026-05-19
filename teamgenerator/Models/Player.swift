//
//  Player.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 18/05/26.
//

import Foundation

enum Gender: String, Codable, CaseIterable {
    case male = "Male"
    case female = "Female"
}

enum SkillLevel: Int, Codable, CaseIterable {
    case beginner = 1
    case intermediate = 2
    case advanced = 3
    case expert = 4
    case pro = 5
    
    var label: String {
        switch self {
        case .beginner: return "Iniciante"
        case .intermediate: return "Intermediário"
        case .advanced: return "Avançado"
        case .expert: return "Especialista"
        case .pro: return "Profissional"
        }
    }
}

struct Player: Identifiable, Codable, Hashable {
    var id: UUID = UUID()          // identificador único, gerado automaticamente
    var name: String      // nome do jogador
    var gender: Gender    // .male ou .female
    var skillLevel: SkillLevel  // nível de 1 a 5
    var isSelected: Bool = true  // está na partida de hoje? (o toggle do Roster)
}
