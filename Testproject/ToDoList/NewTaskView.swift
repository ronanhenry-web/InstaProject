//
//  NewTaskView.swift
//  TestProject
//
//  Created by Ronan Henry on 26/03/2023.
//

import SwiftUI

struct NewTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var tasksList: [Task]
    
    @State private var taskName = ""
    @State private var dueDate = Date.now
    @State private var hasDueDate = false
    @State private var tag = 0
    
    var body: some View {
        VStack(spacing: 24) {
            TextField("Enter a task name", text: $taskName)
                .textFieldStyle(.roundedBorder)
            
            Toggle("Ajouter une date", isOn: $hasDueDate)
            
            if hasDueDate {
                DatePicker("A faire pour le : ", selection: $dueDate)
            }
            
            Picker(selection: $tag, label: Text("Picker")) {
                Text(Task.Priority.high.rawValue).tag(1)
                Text(Task.Priority.normal.rawValue).tag(2)
                Text(Task.Priority.low.rawValue).tag(3)
                Text("Aucune").tag(0)
            }
            .pickerStyle(.segmented)
            
            Button {
                let newTask = createTask()
                addNewTask(task: newTask)
                // Faire disparaitre la modale
                dismiss()
            } label: {
                Text("Ajouter")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }

        }
        .padding()
    }
    
    private func createTask() -> Task {
        
        let optionalDueDate = hasDueDate ? dueDate : nil
        
        var priority: Task.Priority? = nil
        switch tag {
        case 1:
            priority = .high
        case 2:
            priority = .normal
        case 3:
            priority = .low
        default:
            priority = nil
        }
        
        return Task(
            name: taskName,
            dueDate: optionalDueDate,
            priority: priority
        )
    }
    
    private func addNewTask(task: Task) {
        tasksList.append(task)
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(tasksList: .constant([]))
    }
}
