//
//  AddTask.swift
//  ToDoApp
//
//  Created by Gerardo Ramos on 16/01/25.
//

import Foundation
import ComposableArchitecture

struct AddTask: Reducer {
    struct State: Equatable {
        var title: String = ""
        var description: String = ""
        var newTask: Task?
    }

    enum Action {
        case updateTitle(String)
        case updateDescription(String)
        case submit
    }

    var body: some ReducerOf<AddTask> {
        Reduce { state, action in
            switch action {
                case .updateTitle(let title):
                    state.title = title
                    return .none
                case .updateDescription(let description):
                    state.description = description
                    return .none
                case .submit:
                    let newTask = Task(title: state.title, description: state.description)
                    state.newTask = newTask
                    return .none
            }
        }
    }
}
