//
//  SignInViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import FirebaseAuth

class SignInViewViewModel: BaseViewModel {
	@Published var username = ""
	@Published var password = ""
	@Published var errorMessage = ""
	@Published var isMobile = false
	
	func signIn() {
		guard isValidSubmission() else {
			return
		}
		
		if isMobile {
			
		} else {
			Auth.auth().signIn(withEmail: username, password: password) { [weak self] result, error in
				guard let error = error else {
					return
				}
				
				self?.errorMessage = error.localizedDescription
			}
		}
	}
	
	private func isValidSubmission() -> Bool {
		guard !isMobile else {
			errorMessage = "Mobile number login is not yet available"
			return false
		}
		
		guard !isMobile && username.isValidEmailAddress() else {
			errorMessage = "Enter a valid email address"
			return false
		}
		
//		TODO: Uncomment this when mobile number sign in is introduced
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
}
