//
//  GroupManager.swift
//  teamgenerator
//
//  Created by Paulo Roberto on 22/05/26.
//

import Foundation

@Observable
class GroupManager {
    
    private(set) var groups: [Group] = []
    
    init() {
        loadGroups()
    }
    
    func addGroup(_ group: Group) {
        groups.append(group)
        saveGroups()
    }
    
    func deleteGroup(_ group: Group) {
        groups.removeAll() { $0.id == group.id }
        saveGroups()
    }
    
    func updateGroup(_ group: Group) {
        if let index = groups.firstIndex(where: { $0.id == group.id }) {
            groups[index] = group
            saveGroups()
        }
    }
    
    private func saveGroups() {
        if let encoded = try? JSONEncoder().encode(groups) {
            UserDefaults.standard.set(encoded, forKey: "SavedGroups")
        }
    }
    
    private func loadGroups() {
        if let data = UserDefaults.standard.data(forKey: "SavedGroups"),
           let decoded = try? JSONDecoder().decode([Group].self, from: data) {
            groups = decoded
        }
    }
}
