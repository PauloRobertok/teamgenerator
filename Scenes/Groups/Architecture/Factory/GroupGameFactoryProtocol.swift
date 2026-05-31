//
//  GroupGameFactoryProtocol.swift
//  teamgenerator
//
//  Created by Ravi navarro on 30/05/26.
//

import SwiftUI

protocol GroupGameFactoryProtocol {
    func makeRepository() -> GroupGameRepositoryProtocol
    func makeManager() -> GroupGameManager
    func makeViewModel() -> GroupGameViewModel
    func makeView() -> AnyView
}
