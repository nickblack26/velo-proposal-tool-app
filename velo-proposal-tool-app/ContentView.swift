//
//  ContentView.swift
//  velo-proposal-tool-app
//
//  Created by Nick Black on 5/3/24.
//

import SwiftUI
import SwiftData

private enum Tab: String, CaseIterable {
	case overview, activity, settings
}

private enum ProposalTab: String, CaseIterable {
	case overview, workplan, products, settings
}

struct ContentView: View {
	@Environment(SupabaseManager.self) private var supabase
	@Environment(\.modelContext) private var modelContext
	
	@State private var selectedTab: Tab? = .overview
	@State private var selectedProposalTab: ProposalTab? = .overview
	@State private var selectedProposal: Proposal?
	
	@Query private var proposals: [Proposal]
	
	var body: some View {
		NavigationSplitView  {
			List(
				Tab.allCases,
				id: \.self,
				selection: $selectedTab
			) { tab in
				
				Text(tab.rawValue.capitalized)
					.tag(tab)
			}
		} content: {
			List(
				proposals,
				selection: $selectedProposal
			) { proposal in
				VStack(alignment: .leading) {
					Text(proposal.name)
						.fontWeight(.semibold)
					
					HStack {
						Text(proposal.status.capitalized)
							.padding(.horizontal, 10)
							.padding(.vertical, 2)
							.background(.blue)
							.foregroundStyle(.white)
							.clipShape(RoundedRectangle(cornerRadius: 6))
						
						Spacer()
						
						Text(proposal.updatedAt, format: .iso8601.day())
							.font(.caption)
							.foregroundStyle(.secondary)
					}
				}
//				.badge("Testing")
				.tag(proposal)
			}
			.searchable(text: .constant(""))
			.toolbar {
				ToolbarItem(placement: .primaryAction) {
					Button("Add proposal", systemImage: "plus") {
						
					}
				}
			}
		} detail: {
			if let proposal = selectedProposal {
				TabView(selection: $selectedProposalTab) {
					ProposalOverview(proposal: proposal)
						.tabItem { Text(ProposalTab.overview.rawValue.capitalized) }
						.tag(ProposalTab.overview)
					
					VStack {
						
					}
					.tabItem { Text(ProposalTab.workplan.rawValue.capitalized) }
					.tag(ProposalTab.workplan)
					
					VStack {
						
					}
					.tabItem { Text(ProposalTab.products.rawValue.capitalized) }
					.tag(ProposalTab.products)
					
					VStack {
						
					}
					.tabItem { Text(ProposalTab.settings.rawValue.capitalized) }
					.tag(ProposalTab.settings)
				}
			} else {
				Text("Select")
			}
			
		}
		.task {
			await supabase.updateDataInDatabase(modelContext: modelContext)
		}
	}
	
	private func addItem() {
		withAnimation {
			let newItem = Item(timestamp: Date())
			modelContext.insert(newItem)
		}
	}
	
	private func deleteItems(offsets: IndexSet) {
		withAnimation {
			for index in offsets {
				modelContext.delete(proposals[index])
			}
		}
	}
}

#Preview {
	@State var supabase = SupabaseManager()
	
	return ContentView()
		.modelContainer(for: Proposal.self, inMemory: true)
		.environment(supabase)
		.frame(minHeight: 500)
}
