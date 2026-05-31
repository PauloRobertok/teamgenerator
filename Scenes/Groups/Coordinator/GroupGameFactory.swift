//
//  GroupGameFactory.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 30/05/26.
//

import SwiftUI

protocol GroupGameFactoryProtocol {
    func makeRepository() -> GroupGameRepositoryProtocol
    func makeManager() -> GroupGameManager
    func makeViewModel() -> GroupGameViewModel
    func makeView() -> AnyView
}

final class GroupGameFactory: GroupGameFactoryProtocol {
    
    // MARK: - Repository
    
    func makeRepository() -> GroupGameRepositoryProtocol {
        return GroupGameRepository()
    }
    
    // MARK: - Manager
    
    func makeManager() -> GroupGameManager {
        let repository = makeRepository()
        return GroupGameManager(repository: repository)
    }
    
    // MARK: - ViewModel
    
    func makeViewModel() -> GroupGameViewModel {
        let manager = makeManager()
        return GroupGameViewModel(manager: manager)
    }
    
    // MARK: - View
    
    func makeView() -> AnyView {
        let viewModel = makeViewModel()
        return AnyView(GroupGameView(viewModel: viewModel))
    }
}
