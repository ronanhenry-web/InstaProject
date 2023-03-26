//
//  Task.swift
//  TestProject
//
//  Created by Ronan Henry on 26/03/2023.
//

import Foundation

// 1 - Ajouter le protocole ObservableObject à l'object
//     (qui doit être une class)
// 2 - Publier autant de propriétés qu'on veut avec @Published

class Task: Identifiable, ObservableObject {
    let id = UUID()
    @Published var name: String
    let dueDate: Date?
    let priority: Priority?
    
    init(name: String, dueDate: Date? = nil, priority: Priority? = nil) {
        self.name = name
        self.dueDate = dueDate
        self.priority = priority
    }
    
    enum Priority: String {
        case high = "Haute"
        case normal = "Normale"
        case low = "Basse"
    }
}

extension Task {
    static let previewTasks = [
        Task(name: "Rendre le projet"),
        Task(name: "Faire l'appel", dueDate: .now + 10000),
        Task(name: "Commander à manger", priority: .high),
        Task(name: "Finir le rapport", priority: .low)
    ]
}

