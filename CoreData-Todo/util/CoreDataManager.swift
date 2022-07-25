//
//  CoreDataManager.swift
//  CoreData-Todo
//
//  Created by Wei Wu on 2022/07/25.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "TodoModel")
        persistentContainer.loadPersistentStores { desccription, error in
            if let error = error{
                fatalError("Unable to initialize Core Data: \(error)")
            }
        }
    }
}
