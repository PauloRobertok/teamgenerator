//
//  GroupViewModelProtocol.swift
//  teamgenerator
//
//  Created by Ravi navarro on 28/05/26.
//

import Foundation

protocol GroupViewModelProtocol: ObservableObject {
    var state: GroupViewState { get }
    func loadData()
    func generateTeams() -> [Team]
}
