//
//  SignUpViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import FirebaseAuth

class SignUpViewViewModel: BaseViewModel {
	@Published var name = ""
	@Published var email = ""
	@Published var password = ""
	@Published var errorMessage = ""
	
	private func isValidSubmission() -> Bool {
		if email.trimmingCharacters(in: .whitespaces).isEmpty || email.isValidEmailAddress() {
			errorMessage = "Enter a valid email address"
		} else if password.trimmingCharacters(in: .whitespaces).isEmpty {
			errorMessage = "Enter a valid password"
		} else if name.trimmingCharacters(in: .whitespaces).isEmpty {
			errorMessage = "Enter a valid name"
		} else {
			errorMessage = ""
			return true
		}
		return false
	}
	
	func signUp() {
		guard isValidSubmission() else {
			Auth.auth().createUser(withEmail: email, password: password)
			return
		}
	}
}
