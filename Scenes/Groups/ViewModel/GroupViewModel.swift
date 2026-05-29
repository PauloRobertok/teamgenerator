//
//  GroupViewModel.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 22/05/26.
//

import Combine

final class GroupViewModel: GroupViewModelProtocol {
    let state: GroupViewState
    
    let objectWillChange: ObservableObjectPublisher = .init()
    
    init(state: GroupViewState) {
        self.state = state
    }
    
    func loadData() {}
    
    func generateTeams() -> [Team] {
        let players: [Player] = []
        let numberOfTeams: Int = .zero
        let minWomenPerTeam: Int = .zero
        
        // Filtra apenas jogadores selecionados
        let selectedPlayers = players.filter { $0.isSelected }
        
        // Valida se tem jogadores suficientes
        guard selectedPlayers.count >= numberOfTeams else {
            return [] // Retorna vazio se nao der pra formar time
        }
        
        // Separa mulheres e homens
                let females = selectedPlayers.filter { $0.gender == .female }
                let males = selectedPlayers.filter { $0.gender == .male }
        
        // Cria times vazios
                var teams: [Team] = []
                for i in 1...numberOfTeams {
                    teams.append(Team(name: "Time \(i)", players: []))
                }
        
        // Distribui mulheres primeiro (uma por time quando possível)
                for (index, female) in females.enumerated() {
                    let teamIndex = index % numberOfTeams
                    teams[teamIndex].players.append(female)
                }
        // Ordena homens por skill (do melhor pro pior)
                let sortedMales = males.sorted { $0.skillLevel.rawValue > $1.skillLevel.rawValue }
        
        // Distribui homens em zig-zag para balancear
                var currentTeamIndex = 0
                var direction = 1  // 1 = avança, -1 = volta
                
                for male in sortedMales {
                    teams[currentTeamIndex].players.append(male)
                    
                    currentTeamIndex += direction
                    
                    // Inverte direção quando chega no fim ou no início
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
