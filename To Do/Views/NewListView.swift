//
//  NewListView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/18.
//

import SwiftUI
import FirebaseFirestore

struct NewListView: View {
	@StateObject private var viewModel = NewListViewViewModel()
	@Binding var isPresented: Bool
	let userID: String
	
    var body: some View {
		VStack {
			Text(.title)
				.bold()
				.font(.largeTitle)
				.padding(.top, 50)
			
			Form {
				TextField(.listTitle, text: $viewModel.title)
					.textFieldStyle(DefaultTextFieldStyle())

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
    }
}

struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
		NewListView(isPresented: .constant(true), userID: "XPFdF3DLiNQO64Um3MVQGuftbdG3")
    }
}

fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("newlist.header.title")
	static var listTitle = LocalizedStringKey("newlist.form.title.label")
	static var saveButton = LocalizedStringKey("newlist.form.save.button")
}
