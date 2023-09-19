//
//  SignInViewViewModel.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn
import FacebookLogin
import FacebookCore

class SignInViewViewModel: AuthBaseViewModel {
	@Published var username = ""
	@Published var password = ""
	@Published var errorMessage = ""
	@Published var isMobile = false
	
	func signIn() {
		errorMessage = ""
		
		guard isValidSubmission() else {
			return
		}
		
		if isMobile {
			
		} else {
			Auth.auth().signIn(withEmail: username, password: password) { [weak self] result, error in
				guard let error = error else { return }
				self?.errorMessage = error.localizedDescription
			}
		}
	}
	
	func signInWithApple() {
		
	}
	
	func signInWithGoogle(result signInResult: GIDSignInResult?) {
		guard let user = signInResult?.user, let idToken = user.idToken else { return }
		let accessToken = user.accessToken
		let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
		
		Auth.auth().signIn(with: credential) { [weak self] result, error in
			guard let error = error else { return }
			self?.errorMessage = error.localizedDescription
		}
	}
	
	func signInWithFacebook() {
		let loginManager = LoginManager()
		loginManager.logIn(permissions: ["public_profile"], from: nil) { loginManagerLoginResult, error in
			guard let error = error else {
				guard let accessToken = AccessToken.current else { return }
				print("Access Token: \(accessToken)")
				
				let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
				Auth.auth().signIn(with: credential) { [weak self] result, error in
					guard let error = error else {
						guard let userID = self?.firebaseUser?.uid else { return }
						let user = User(id: userID, name: self?.firebaseUser?.displayName ?? "User", email: self?.firebaseUser?.email ?? "")
						self?.storeUser(user)
						return
					}
				}
				return
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
