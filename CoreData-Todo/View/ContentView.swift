//
//  ContentView.swift
//  CoreData-Todo
//
//  Created by Wei Wu on 2022/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var title: String = ""
    @State private var selectedPriority: Priority = .medium
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)]) private var allTask: FetchedResults<Task>
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    NavigationLink {
                        AddTaskView(title: $title, selectedPriority: $selectedPriority)
                    } label: {
                        HStack{
                            Image(systemName: "plus")
                            Text("add Task")
                        }
                    }
                    Spacer()
                }
                List{
                    ForEach(allTask){ task in
                        HStack{
                            Circle()
                                .fill(styleForPriority(task.priority!))
                                .frame(width: 15, height: 15)
                            Text(task.title ?? "")
                            Spacer()
                            Image(systemName: task.isComplete ? "checkmark.circle" : "circle")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    updateTask(task)
                                }
                        }
                        .listRowBackground(Color.white)
                    }
                    .onDelete(perform: deleteTask)
                }
                .listStyle(.inset)
                .background(.clear)
                Spacer()
            }
            .padding()
            .navigationTitle("Tasks")
        }

    }
    
    private func updateTask(_ task: Task){
        task.isComplete = !task.isComplete
        
        do{
            try viewContext.save()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    private func deleteTask(at offsets: IndexSet){
        offsets.forEach { index in
            let task = allTask[index]
            viewContext.delete(task)
            do{
                try viewContext.save()
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
    private func styleForPriority(_ value: String) -> Color{
        let priority = Priority(rawValue: value)
        
        switch priority {
        case .low:
            return .green
        case .medium:
            return .gray
        case .high:
            return .red
        default:
            return .black
        }
    }
}
