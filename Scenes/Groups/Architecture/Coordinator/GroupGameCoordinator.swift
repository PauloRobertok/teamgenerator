//
//  GroupGameCoordinator.swift
//  teamgenerator
//
//  Created by Ravi navarro on 30/05/26.
//

import SwiftUI

final class GroupGameCoordinator: CoordinatorProtocol {
    private let factory: GroupGameFactoryProtocol
        
    init(factory: GroupGameFactoryProtocol = GroupGameFactory()) {
        self.factory = factory
    }
        
    func show() -> some View {
        return factory.makeView()
    }
}
