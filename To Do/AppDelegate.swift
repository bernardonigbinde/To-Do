//
//  AppDelegate.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI
import FirebaseCore

@main
struct AppDelegate: App {
	init() {
		FirebaseApp.configure()
	}
	
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
