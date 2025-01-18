//
//  ContentView.swift
//  ToDoApp
//
//  Created by Gerardo Ramos on 16/01/25.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    @State private var tasks: [Task] = [Task.mock, Task.mock, Task.mock]

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(tasks) { task in
                        NavigationLink(destination: TaskView(task: task)) {
                            VStack(alignment: .leading){
                                Text(task.title)
                                    .font(.headline)
                                Text(task.description)
                                    .font(.subheadline)
                            }
                        }

                    }
                }
            }
            .navigationTitle("ToDo List")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(
                        destination:
                            AddTaskView(addTaskStore: Store(initialState: .init(),
                                                            reducer:{ AddTask()._printChanges() }))
                    ) {
                        Image(systemName: "plus.circle")
                    }
                }
            }
        }
    }
}

struct TaskView: View {
    @State var task: Task

    var body: some View {
        Form {
            Text(task.title)
            Text(task.description)
        }
        .navigationTitle("View Task")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {

                } label: {
                    Text("Done")
                }
            }
        }
    }
}

struct AddTaskView: View {

    let addTaskStore: StoreOf<AddTask>

    var body: some View {
        WithViewStore(addTaskStore, observe: {$0}) {viewStore in
            NavigationStack {
                Form {
                    TextField("Title", text: viewStore.binding(get: \.title, send: { .updateTitle($0)}))
                    TextField("Description", text: viewStore.binding(get: \.description, send: {.updateDescription($0)}))
                }
                .navigationTitle("Add New Task")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            viewStore.send(.submit)
                        } label: {
                            Text("Done")
                        }
                    }
                }
            }
        }

    }
}

#Preview {
    ContentView()
}
