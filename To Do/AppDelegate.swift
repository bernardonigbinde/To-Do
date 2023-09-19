//
//  AppDelegate.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/19.
//

import Foundation
import Firebase
import GoogleSignIn
import FacebookCore


class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		FirebaseApp.configure()
		ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
		return true
	}
	
	@available(iOS 9.0, *)
	func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
		ApplicationDelegate.shared.application(
			application,
			open: url,
			sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
			annotation: options[UIApplication.OpenURLOptionsKey.annotation]
		)
		return GIDSignIn.sharedInstance.handle(url)
	}
	
	
}
