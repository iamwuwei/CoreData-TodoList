//
//  AddTaskVieew.swift
//  CoreData-Todo
//
//  Created by Wei Wu on 2022/07/25.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var title: String
    @Binding var selectedPriority: Priority
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            TextField("title", text: $title)
                .textFieldStyle(.roundedBorder)
            Picker("Priority", selection: $selectedPriority) {
                ForEach(Priority.allCases){
                    priority in
                    Text(priority.title).tag(priority)
                }
            }.pickerStyle(.segmented)
            Button {
                addTask()
                dismiss()
            } label: {
                Text("Save")
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            
            Spacer()
        }        
        .navigationTitle("Add Task")
        .padding()
    }
    
    private func addTask(){
        do{
            let task = Task(context: viewContext)
            task.title = title
            task.priority = selectedPriority.rawValue
            task.dateCreated = Date()
            try viewContext.save()
        }
        catch{
            print(error.localizedDescription)
        }
    }
}

