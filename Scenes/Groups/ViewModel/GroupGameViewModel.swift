//
//  GroupGameViewModel.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 22/05/26.
//

import Combine
import SwiftUI

final class GroupGameViewModel: GroupGameViewModelProtocol {
    @Published var state: GroupGameViewState
    @Published var groups: [GroupGame] = []
    
    private let manager: GroupGameManager
    
    init(state: GroupGameViewState = .loading, manager: GroupGameManager = GroupGameManager()) {
        self.state = state
        self.manager = manager
    }
    
    // MARK: - Load Data
    
    @MainActor
    func loadData() async {
        state = .loading
        
        do {
            let fetchedGroups = try await manager.fetchGroups()
            groups = fetchedGroups
            state = .loaded
        } catch {
            state = .error
        }
    }
    
    // MARK: - Add Group
    
    @MainActor
    func addGroup(_ group: GroupGame) async {
        do {
            try await manager.addGroup(group)
            groups.append(group)
        } catch {
            state = .error
        }
    }
    
    // MARK: - Delete Group
    
    @MainActor
    func deleteGroup(_ group: GroupGame) async {
        do {
            try await manager.deleteGroup(group)
            groups.removeAll { $0.id == group.id }
        } catch {
            state = .error
        }
    }
    
    // MARK: - Update Group
    
    @MainActor
    func updateGroup(_ group: GroupGame) async {
        do {
            try await manager.updateGroup(group)
            if let index = groups.firstIndex(where: { $0.id == group.id }) {
                groups[index] = group
            }
        } catch {
            state = .error
        }
    }
    
    // MARK: - Generate Teams
    
    func generateTeams() -> [Team] {
        let players: [Player] = []
        let numberOfTeams: Int = .zero
        
        let selectedPlayers = players.filter { $0.isSelected }
        
        guard selectedPlayers.count >= numberOfTeams else {
            return []
        }
        
        let females = selectedPlayers.filter { $0.gender == .female }
        let males = selectedPlayers.filter { $0.gender == .male }
        
        var teams: [Team] = []
        for i in 1...numberOfTeams {
            teams.append(Team(name: "Time \(i)", players: []))
        }
        
        for (index, female) in females.enumerated() {
            let teamIndex = index % numberOfTeams
            teams[teamIndex].players.append(female)
        }
        
        let sortedMales = males.sorted { $0.skillLevel.rawValue > $1.skillLevel.rawValue }
        
        var currentTeamIndex = 0
        var direction = 1
        
        for male in sortedMales {
            teams[currentTeamIndex].players.append(male)
            
            currentTeamIndex += direction
            
            if currentTeamIndex >= numberOfTeams {
                currentTeamIndex = numberOfTeams - 1
                direction = -1
            } else if currentTeamIndex < 0 {
                currentTeamIndex = 0
                direction = 1
            }
        }
        return teams
    }
}
