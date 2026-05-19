//
//  Team.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 18/05/26.
//

import Foundation

struct Team: Identifiable {
    var id: UUID = UUID()
    var name: String
    var players: [Player]
    
    var averageSkill: Double {
        guard !players.isEmpty else { return 0 }
        let total = players.reduce(0) { $0 + $1.skillLevel.rawValue }
        return Double(total) / Double(players.count)
        
    }
        var femaleCount: Int {
            players.filter { $0.gender == .female }.count
    }
}
