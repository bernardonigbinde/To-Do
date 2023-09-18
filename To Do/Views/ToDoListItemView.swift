//
//  ToDoListItemView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct ToDoListItemView: View {
	@StateObject private var viewModel = ToDoListItemViewViewModel()
	@Binding var todo: TodoListItem
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(todo.title)
				.font(.title)
				.padding(.bottom, -10)
			Toggle("Completed", isOn: $todo.completed)
				.font(.subheadline)
		}
	}
}

struct ToDoListItemView_Previews: PreviewProvider {
	static var previews: some View {
		ToDoListItemView(todo: .constant(
			TodoListItem(
				id: "",
				ownerID: "",
				title: "Buy milk",
				dueAt: Date().timeIntervalSince1970)
		))
	}
}
