//
//  Task.swift
//  ToDoApp
//
//  Created by Gerardo Ramos on 16/01/25.
//
import Foundation

struct Task: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var description: String

}

extension Task {
    static let mock: Task = Task(title: "Mock Task", description: "This is a mock task")
}
