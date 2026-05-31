//
//  PersistenceController.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 30/05/26.
//

import CoreData

final class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }
    
    // MARK: - Initialization
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "GroupGame")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unable to load persistent stores: \(error), \(error.userInfo)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    // MARK: - Preview
    
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let viewContext = controller.viewContext
        
        // Create sample data for previews
        let sampleGroup = GroupGameEntity(context: viewContext)
        sampleGroup.id = UUID()
        sampleGroup.name = "Vôlei da Praia"
        sampleGroup.sportType = "volleyball"
        sampleGroup.createdAt = Date()
        sampleGroup.minWomenPerTeam = 1
        
        let player1 = PlayerEntity(context: viewContext)
        player1.id = UUID()
        player1.name = "João"
        player1.gender = "male"
        player1.skillLevel = 3
        player1.isSelected = true
        player1.group = sampleGroup
        
        let player2 = PlayerEntity(context: viewContext)
        player2.id = UUID()
        player2.name = "Maria"
        player2.gender = "female"
        player2.skillLevel = 4
        player2.isSelected = true
        player2.group = sampleGroup
        
        do {
            try viewContext.save()
        } catch {
            fatalError("Error creating preview: \(error)")
        }
        
        return controller
    }()
    
    // MARK: - Save Context
    
    func save() throws {
        let context = viewContext
        if context.hasChanges {
            try context.save()
        }
    }
    
    // MARK: - Background Context
    
    func newBackgroundContext() -> NSManagedObjectContext {
        return container.newBackgroundContext()
    }
}
