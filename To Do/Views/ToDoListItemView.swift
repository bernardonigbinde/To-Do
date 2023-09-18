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
		HStack(alignment: .center) {
			VStack(alignment: .leading) {
				Text(todo.title)
					.font(.body)
				Text(todo.dueAt.toFormattedDateTime())
					.font(.subheadline)
					.foregroundColor(Color.gray)
			}
			
			Spacer()
			
			Button {
				todo.completed.toggle()
			} label: {
				Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
			}
		}
		.padding(.vertical, 10)
		.swipeActions(
			trailing: [
				SwipeActionButton(
					text: Text("Delete"),
					action: {
						
					},
					tint: .red
				)
			],
			allowsFullSwipeTrailing: true
		)
	}
}

struct ToDoListItemView_Previews: PreviewProvider {
	static var previews: some View {
		ToDoListItemView(todo: .constant(
			TodoListItem(
				id: "",
				ownerID: "",
				title: "Buy milk",
				completed: true,
				dueAt: Date().timeIntervalSince1970
			)
		))
	}
}
