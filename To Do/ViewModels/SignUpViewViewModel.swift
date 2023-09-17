//
//  SignUpViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class SignUpViewViewModel: BaseViewModel {
	@Published var name = ""
	@Published var username = ""
	@Published var password = ""
	@Published var errorMessage = ""
	@Published var isMobile = false
	
	func signUp() {
		guard isValidSubmission() else {
			return
		}
		
		if isMobile {
			//
		} else {
			signUpWithEmail()
		}
	}
	
	private func isValidSubmission() -> Bool {
		guard !isMobile else {
			errorMessage = "Signing up with Mobile number is not yet available"
			return false
		}
		
		guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
			errorMessage = "Enter a valid name"
			return false
		}
		
		guard !isMobile && username.isValidEmailAddress() else {
			errorMessage = "Enter a valid email address"
			return false
		}
		
//		TODO: Uncomment this when mobile number sign up is introduced
//		guard isMobile && username.isValidMobileNumber() else {
//			errorMessage = "Enter a valid mobile number"
//			return false
//		}
		
		guard password.isValidPassword() else {
			errorMessage = "Enter a valid password"
			return false
		}
		
		return true
	}
	
	private func signUpWithEmail() {
		Auth.auth().createUser(withEmail: username, password: password) { [weak self] result, error in
			guard let userID = result?.user.uid else {
				return
			}
			
			self?.insertUserRecord(id: userID)
		}
	}
	
	private func insertUserRecord(id: String) {
		let user = User(id: id, name: name, email: username, createdAt: Date().timeIntervalSince1970)
		let db = Firestore.firestore()
		db.collection("users")
			.document(id)
			.setData(user.toJson())
	}
}
