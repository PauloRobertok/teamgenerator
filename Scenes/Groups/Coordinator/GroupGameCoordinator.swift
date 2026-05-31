//
//  GroupGameCoordinator.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 30/05/26.
//

import SwiftUI

protocol CoordinatorProtocol {
    associatedtype ContentView: View
    func show() -> ContentView
}

final class GroupGameCoordinator: CoordinatorProtocol {
    
    private let factory: GroupGameFactoryProtocol
    
    // MARK: - Initialization
    
    init(factory: GroupGameFactoryProtocol = GroupGameFactory()) {
        self.factory = factory
    }
    
    // MARK: - Show Module
    
    func show() -> some View {
        return factory.makeView()
    }
}
