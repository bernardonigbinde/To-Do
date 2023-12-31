//
//  DashboardView.swift
//  To Do
//
//  Created by Bernard Onigbinde on 2023/09/17.
//

import SwiftUI

struct DashboardView: View {
	@StateObject private var viewModel = DashboardViewViewModel()

    var body: some View {
		TabView {
			ToDoListView()
				.tabItem {
					Label(.homeTabLabel, systemImage: "house")
				}
			ListsView()
				.tabItem {
					Label(.listsTabLabel, systemImage: "list.triangle")
				}
			ProfileView()
				.tabItem {
					Label(.profileTabLabel, systemImage: "person.circle")
				}
			SettingsView()
				.tabItem {
					Label(.settingsTabLabel, systemImage: "gearshape.fill")
				}
		}
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

fileprivate extension LocalizedStringKey {
	static var homeTabLabel = LocalizedStringKey("dashboard.tabview.home.label")
	static var listsTabLabel = LocalizedStringKey("dashboard.tabview.lists.label")
	static var profileTabLabel = LocalizedStringKey("dashboard.tabview.profile.label")
	static var settingsTabLabel = LocalizedStringKey("dashboard.tabview.settings.label")
}
