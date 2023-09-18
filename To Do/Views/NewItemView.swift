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
				
				Picker(selection: $viewModel.todoListID, label: Text(.listLabel)) {
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
				title: Text(.errorAlertTitle),
				message: Text(viewModel.errorMessage),
				dismissButton: .default(Text(.alertOkButtonLabel), action: {
					viewModel.showAlert = false
				})
			)
		}
		.onAppear {
			viewModel.getLists()
		}
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
		NewItemView(isPresented: .constant(true))
    }
}

fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("newitem.header.title")
	static var itemTitle = LocalizedStringKey("newitem.form.title.label")
	static var listLabel = LocalizedStringKey("newitem.form.list.label")
	static var dueAt = LocalizedStringKey("newitem.form.dueAt")
	static var saveButton = LocalizedStringKey("newitem.form.save.button")
	static var errorAlertTitle = LocalizedStringKey("newitem.alert.error.title")
	static var alertOkButtonLabel = LocalizedStringKey("newitem.alert.ok.button")
}
