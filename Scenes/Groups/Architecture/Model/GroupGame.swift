//
//  Group.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 18/05/26.
//

import SwiftUI

struct GroupGame: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var sport: SportType
    var players: [Player]
    var minWomenPerTeam: Int = 1
    var createdAt: Date = Date()
}
