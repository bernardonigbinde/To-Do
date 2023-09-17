//
//  NewItemViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation

class NewItemViewViewModel: BaseViewModel {
	@Published var title: String = ""
	@Published var dueTime: Date = Date()
	@Published var errorMessage = ""
	@Published var showAlert = false
	
	var canSave: Bool {
		guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
			errorMessage = "Title cannot be empty."
			showAlert = true
			return false
		}
		
		guard dueTime >= Date() else {
			errorMessage = "You can not set a date or time in the past."
			showAlert = true
			return false
		}
		
		errorMessage = ""
		showAlert = false
		return true
	}
	
	func save() -> Bool {
		if canSave {
			return true
		} else {
			return false
		}
	}
}
