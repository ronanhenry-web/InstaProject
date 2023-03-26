//
//  TaskCell.swift
//  TestProject
//
//  Created by Ronan Henry on 26/03/2023.
//

import SwiftUI

struct TaskCell: View {
    
    @ObservedObject var task: Task
    
    var body: some View {
        Text(task.name)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task.previewTasks.first!)
    }
}
