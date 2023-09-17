//
//  To_DoApp.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI
import FirebaseCore

@main
struct To_DoApp: App {
	init() {
		FirebaseApp.configure()
	}
	
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
