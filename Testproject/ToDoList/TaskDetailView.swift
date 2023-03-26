//
//  TaskDetailView.swift
//  TestProject
//
//  Created by Ronan Henry on 26/03/2023.
//

import SwiftUI

struct TaskDetailView: View {
    
    @ObservedObject var task: Task
    // @Binding var task: Task
    
    var body: some View {
        VStack {
            Text(task.name)
            TextField("Nom de la tâche", text: $task.name)
            if let dueDate = task.dueDate {
                Text(dueDate.description)
            }
            if let priority = task.priority {
                Text(priority.rawValue)
            }
            // Bouton pour changer la priorité
            // task.priotity = nouvellePrio
        }
        .navigationTitle(task.name)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task.previewTasks.first!)
    }
}
