//
//  GroupGameViewState.swift
//  teamgenerator
//
//  Created by Ravi navarro on 28/05/26.
//

enum GroupGameViewState {
    case loading
    case error
    case loaded
    case teams(players: [Player])
}
