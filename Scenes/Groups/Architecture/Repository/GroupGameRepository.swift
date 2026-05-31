//
//  GroupGameRepository.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 30/05/26.
//

import CoreData
import Foundation

final class GroupGameRepository: GroupGameRepositoryProtocol {
    
    private let persistenceController: PersistenceController
    
    init(persistenceController: PersistenceController = .shared) {
        self.persistenceController = persistenceController
    }
    
    // MARK: - Fetch All Groups
    
    func fetchAll() async throws -> [GroupGame] {
        let context = persistenceController.viewContext
        
        return try await context.perform {
            let request: NSFetchRequest<GroupGameEntity> = GroupGameEntity.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(keyPath: \GroupGameEntity.createdAt, ascending: false)]
            
            let entities = try context.fetch(request)
            return entities.map { $0.toDomainModel() }
        }
    }
    
    // MARK: - Save Group
    
    func save(_ group: GroupGame) async throws {
        let context = persistenceController.viewContext
        
        try await context.perform {
            let entity = GroupGameEntity(context: context)
            entity.updateFromDomainModel(group)
            
            // Save players
            for player in group.players {
                let playerEntity = PlayerEntity(context: context)
                playerEntity.updateFromDomainModel(player)
                playerEntity.group = entity
            }
            
            try context.save()
        }
    }
    
    // MARK: - Update Group
    
    func update(_ group: GroupGame) async throws {
        let context = persistenceController.viewContext
        
        try await context.perform {
            let request: NSFetchRequest<GroupGameEntity> = GroupGameEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", group.id as CVarArg)
            
            guard let entity = try context.fetch(request).first else {
                throw RepositoryError.notFound
            }
            
            entity.updateFromDomainModel(group)
            
            // Remove old players
            if let existingPlayers = entity.players as? Set<PlayerEntity> {
                for player in existingPlayers {
                    context.delete(player)
                }
            }
            
            // Add updated players
            for player in group.players {
                let playerEntity = PlayerEntity(context: context)
                playerEntity.updateFromDomainModel(player)
                playerEntity.group = entity
            }
            
            try context.save()
        }
    }
    
    // MARK: - Delete Group
    
    func delete(_ group: GroupGame) async throws {
        let context = persistenceController.viewContext
        
        try await context.perform {
            let request: NSFetchRequest<GroupGameEntity> = GroupGameEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", group.id as CVarArg)
            
            guard let entity = try context.fetch(request).first else {
                throw RepositoryError.notFound
            }
            
            context.delete(entity)
            try context.save()
        }
    }
    
    // MARK: - Fetch By ID
    
    func fetchById(_ id: UUID) async throws -> GroupGame? {
        let context = persistenceController.viewContext
        
        return try await context.perform {
            let request: NSFetchRequest<GroupGameEntity> = GroupGameEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
            
            guard let entity = try context.fetch(request).first else {
                return nil
            }
            
            return entity.toDomainModel()
        }
    }
}
