//
//  CoreData_TodoApp.swift
//  CoreData-Todo
//
//  Created by Wei Wu on 2022/07/25.
//

import SwiftUI

@main
struct CoreData_TodoApp: App {
    let persistentContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
