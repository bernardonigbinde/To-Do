//
//  NewItemView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct NewItemView: View {
	@StateObject private var viewModel = NewItemViewViewModel()

    var body: some View {
		VStack {
			Text(.title)
				.bold()
				.font(.largeTitle)
				.padding(.top)
			
			Form {
				TextField(.itemTitle, text: $viewModel.title)
					.textFieldStyle(DefaultTextFieldStyle())
				
				DatePicker(.dueTime, selection: $viewModel.dueTime)
					.datePickerStyle(GraphicalDatePickerStyle())
				
				PrimaryButton(title: .saveButton, backgroundColor: .pink) {
					
				}
				.padding(.vertical)
			}
		}
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}

fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("newitem.header.title")
	static var itemTitle = LocalizedStringKey("newitem.form.title")
	static var dueTime = LocalizedStringKey("newitem.form.duetime")
	static var saveButton = LocalizedStringKey("newitem.form.save.button")
}
