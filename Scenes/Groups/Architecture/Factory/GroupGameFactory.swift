//
//  GroupGameFactory.swift
//  teamgenerator
//
//  Created by Ravi navarro on 30/05/26.
//

import SwiftUI

final class GroupGameFactory: GroupGameFactoryProtocol {
    func makeRepository() -> GroupGameRepositoryProtocol {
        return GroupGameRepository()
    }
        
    func makeManager() -> GroupGameManager {
        let repository = makeRepository()
        return GroupGameManager(repository: repository)
    }
        
    func makeViewModel() -> GroupGameViewModel {
        let manager = makeManager()
        return GroupGameViewModel(manager: manager)
    }
        
    func makeView() -> AnyView {
        let viewModel = makeViewModel()
        return AnyView(GroupGameView(viewModel: viewModel))
    }
}
