//
//  TaskList.swift
//  TestProject
//
//  Created by Ronan Henry on 26/03/2023.
//

import SwiftUI

class TaskData: ObservableObject {
    @Published var tasks: [Task]
    
    init(tasks: [Task]) {
        self.tasks = tasks
    }
}

struct TaskList: View {
    
    // MARK: State properties
    @State private var isShowingNewTaskView = false
    @StateObject var taskData: TaskData = TaskData(tasks: Task.previewTasks)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(taskData.tasks) { task in
                    NavigationLink {
                        TaskDetailView(task: task)
                    } label: {
                        TaskCell(task: task)
                    }
                }
            }
        }
        .overlay(alignment: .bottomTrailing) {
            Button {
                isShowingNewTaskView = true
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Circle()
                            .foregroundColor(.blue)
                    )
                    .shadow(radius: 10, y: 5)
            }
            .padding()
        }
        .sheet(isPresented: $isShowingNewTaskView) {
            NewTaskView(tasksList: $taskData.tasks)
        }
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
    }
}
