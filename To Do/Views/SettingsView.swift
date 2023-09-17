//
//  SettingsView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
		NavigationView {
			VStack {
				
			}
			.navigationTitle(.title)
		}
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

fileprivate extension LocalizedStringKey {
	static var title = LocalizedStringKey("settings.header.title")
}
