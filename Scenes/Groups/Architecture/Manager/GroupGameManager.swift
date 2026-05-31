//
//  GroupGameManager.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 22/05/26.
//

import Foundation

@Observable
final class GroupGameManager {
    private(set) var groups: [GroupGame] = []
    
    private let repository: GroupGameRepositoryProtocol
    
    init(repository: GroupGameRepositoryProtocol = GroupGameRepository()) {
        self.repository = repository
    }
    
    // MARK: - Async Methods
    
    func fetchGroups() async throws -> [GroupGame] {
        let fetchedGroups = try await repository.fetchAll()
        groups = fetchedGroups
        return fetchedGroups
    }
    
    func addGroup(_ group: GroupGame) async throws {
        try await repository.save(group)
        groups.append(group)
    }
    
    func deleteGroup(_ group: GroupGame) async throws {
        try await repository.delete(group)
        groups.removeAll { $0.id == group.id }
    }
    
    func updateGroup(_ group: GroupGame) async throws {
        try await repository.update(group)
        if let index = groups.firstIndex(where: { $0.id == group.id }) {
            groups[index] = group
        }
    }
    
    func fetchGroupById(_ id: UUID) async throws -> GroupGame? {
        return try await repository.fetchById(id)
    }
}
