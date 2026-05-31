//
//  GroupGameRepositoryProtocol.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 30/05/26.
//

import Foundation

protocol GroupGameRepositoryProtocol {
    func fetchAll() async throws -> [GroupGame]
    func save(_ group: GroupGame) async throws
    func update(_ group: GroupGame) async throws
    func delete(_ group: GroupGame) async throws
    func fetchById(_ id: UUID) async throws -> GroupGame?
}
