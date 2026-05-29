//
//  GroupViewState.swift
//  teamgenerator
//
//  Created by Ravi navarro on 28/05/26.
//

enum GroupViewState {
    case loading
    case error
    case loaded
    case teams(players: [Player])
}
