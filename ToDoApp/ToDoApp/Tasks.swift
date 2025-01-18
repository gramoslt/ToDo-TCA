//
//  Tasks.swift
//  ToDoApp
//
//  Created by Gerardo Ramos on 16/01/25.
//

import Foundation
import ComposableArchitecture

struct Tasks: Reducer {
    struct State: Equatable {
        var tasks: [Task] = []
        var addTaskState: AddTask.State?
    }

    enum Action {
        case addTask(Task)
        case removeTask(Task)
        case addTaskAction(AddTask.Action)
    }

    var body: some ReducerOf<Tasks> {
        Reduce { state, action in
            switch action {
                case .addTask(let task):
                    state.tasks.append(task)
                    return .none
                case .removeTask(let task):
                    state.tasks.remove(at: 0)
                    return .none
                case .addTaskAction(.submit):
                    if let newTask = state.addTaskState?.newTask {
                        state.tasks.append(newTask)
                    }
                    return .none
                case .addTaskAction(.updateTitle(_)):
                    return .none
                case .addTaskAction(.updateDescription(_)):
                    return .none
            }
        }
    }
}
