//
//  NewItemView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI
import FirebaseFirestoreSwift

struct NewItemView: View {
	@StateObject private var viewModel = NewItemViewViewModel()
	let userID: String
	@Binding var isPresented: Bool
	
    var body: some View {
		VStack {
			Text(.title)
				.bold()
				.font(.largeTitle)
				.padding(.top, 50)
			
			Form {
				TextField(.itemTitle, text: $viewModel.title)
					.textFieldStyle(DefaultTextFieldStyle())
				
				Picker(selection: $viewModel.todoListID, label: Text("List")) {
					ForEach(viewModel.lists, id: \.id) { list in
						Text(list.title).tag(list.id)
					}
				}
				.pickerStyle(MenuPickerStyle())
				

				
				DatePicker(.dueAt, selection: $viewModel.dueAt)
					.datePickerStyle(GraphicalDatePickerStyle())
				
				PrimaryButton(title: .saveButton, backgroundColor: .pink) {
					if viewModel.save() {
						isPresented = false
					}
				}
				.padding(.vertical)
			}
		}
		.alert(isPresented: $viewModel.showAlert) {
			Alert(
				title: Text("Error"),
				message: Text(viewModel.errorMessage),
				dismissButton: .default(Text("OK"), action: {
					viewModel.showAlert = false
				})
			)
		}
		.onAppear {
			viewModel.getLists(for: userID)
		}
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
		NewItemView(userID: "XPFdF3DLiNQO64Um3MVQGuftbdG3", isPresented: .constant(true))
    }
}

fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("newitem.header.title")
	static var itemTitle = LocalizedStringKey("newitem.form.title")
	static var dueAt = LocalizedStringKey("newitem.form.dueAt")
	static var saveButton = LocalizedStringKey("newitem.form.save.button")
}
