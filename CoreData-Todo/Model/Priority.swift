//
//  Priority.swift
//  CoreData-Todo
//
//  Created by Wei Wu on 2022/07/25.
//

import Foundation

enum Priority: String, Identifiable, CaseIterable{
    var id: UUID{
        return UUID()
    }
    
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

extension Priority{
    var title: String{
        switch self{
        case .low:
            return "Low"
        case .medium:
            return "medium"
        case .high:
            return "High"
        }
    }
}

