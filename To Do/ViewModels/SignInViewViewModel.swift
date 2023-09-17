//
//  SignInViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import FirebaseAuth

class SignInViewViewModel: BaseViewModel {
	@Published var email = ""
	@Published var password = ""
	@Published var errorMessage = ""
	
	private func isValidSubmission() -> Bool {
		if email.trimmingCharacters(in: .whitespaces).isEmpty || !email.isValidEmailAddress() {
			errorMessage = "Enter a valid email address"
		} else if password.trimmingCharacters(in: .whitespaces).isEmpty {
			errorMessage = "Enter a valid password"
		} else {
			errorMessage = ""
			return true
		}
		return false
	}
	
	func signIn() {
		guard isValidSubmission() else {
			Auth.auth().signIn(withEmail: email, password: password)
			return
		}
	}
}
