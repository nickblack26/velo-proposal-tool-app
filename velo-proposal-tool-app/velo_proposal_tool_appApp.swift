//
//  velo_proposal_tool_appApp.swift
//  velo-proposal-tool-app
//
//  Created by Nick Black on 5/3/24.
//

import SwiftUI
import SwiftData

@main
struct velo_proposal_tool_appApp: App {
	@State private var supabaseManager = SupabaseManager()
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Proposal.self,
			JSONNull.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
		.environment(supabaseManager)
    }
}
