//
//  SupabaseManager.swift
//  velo-proposal-tool-app
//
//  Created by Nick Black on 5/3/24.
//

import Foundation
import Supabase
import Observation
import SwiftData

@Observable 
class SupabaseManager {
	var client: SupabaseClient
	
	init() {
		self.client = SupabaseClient(
			supabaseURL: URL(
				string: ProcessInfo.processInfo.environment["SUPABASE_URL"] ?? ""
			)!,
			supabaseKey: ProcessInfo.processInfo.environment["SUPABASE_ANON_KEY"] ?? ""
		)
	}
	
	@MainActor
	func updateDataInDatabase(modelContext: ModelContext) async {
		do {
			let itemData: [Proposal] = try await client
				.from("proposals").select("""
					id,
					name,
					labor_hours,
					labor_rate,
					created_at,
					updated_at,
					status
				""")
				.execute()
				.value
			print(itemData)
			for eachItem in itemData {
				modelContext.insert(eachItem)
			}
		} catch {
			print("Error fetching data")
			print(error)
		}
	}
}
