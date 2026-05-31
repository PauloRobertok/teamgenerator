//
//  GroupGameViewModelProtocol.swift
//  teamgenerator
//
//  Created by Ravi navarro on 28/05/26.
//

import Foundation

protocol GroupGameViewModelProtocol: ObservableObject {
    var state: GroupGameViewState { get set }
    var groups: [GroupGame] { get }
    
    func loadData() async
    func addGroup(_ group: GroupGame) async
    func deleteGroup(_ group: GroupGame) async
    func updateGroup(_ group: GroupGame) async
    func generateTeams() -> [Team]
}
