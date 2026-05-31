//
//  GroupGameEntity+Mapping.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 30/05/26.
//

import CoreData
import Foundation

// MARK: - GroupGameEntity Mapping

extension GroupGameEntity {
    func toDomainModel() -> GroupGame {
        let playersList: [Player] = (players as? Set<PlayerEntity>)?.map { $0.toDomainModel() } ?? []
        
        return GroupGame(
            id: id ?? UUID(),
            name: name ?? "",
            sport: SportType(rawValue: sportType ?? "custom") ?? .custom,
            players: playersList,
            minWomenPerTeam: Int(minWomenPerTeam),
            createdAt: createdAt ?? Date()
        )
    }
    
    func updateFromDomainModel(_ group: GroupGame) {
        self.id = group.id
        self.name = group.name
        self.sportType = group.sport.rawValue
        self.minWomenPerTeam = Int16(group.minWomenPerTeam)
        self.createdAt = group.createdAt
    }
}

// MARK: - PlayerEntity Mapping

extension PlayerEntity {
    func toDomainModel() -> Player {
        return Player(
            id: id ?? UUID(),
            name: name ?? "",
            gender: Gender(rawValue: gender ?? "male") ?? .male,
            skillLevel: SkillLevel(rawValue: Int(skillLevel)) ?? .beginner,
            isSelected: isSelected
        )
    }
    
    func updateFromDomainModel(_ player: Player) {
        self.id = player.id
        self.name = player.name
        self.gender = player.gender.rawValue
        self.skillLevel = Int16(player.skillLevel.rawValue)
        self.isSelected = player.isSelected
    }
}
