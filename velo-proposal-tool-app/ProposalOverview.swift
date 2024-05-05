//
//  ProposalOverview.swift
//  velo-proposal-tool-app
//
//  Created by Nick Black on 5/3/24.
//

import SwiftUI
import SwiftData

struct ProposalOverview: View {
	@Query private var products: [Product]
	var proposal: Proposal
	
    var body: some View {
		Grid {
			GridRow {
				VStack(alignment: .leading) {
					SwiftUI.Section("Customer") {
						
					}
					.headerProminence(.increased)
					
					SwiftUI.Section("Expiration Date") {
						DatePicker(
							"Expiration Date",
							selection: .constant(Date()),
							displayedComponents: .date
						)
						.datePickerStyle(.graphical)
					}
					.headerProminence(.increased)
					
					SwiftUI.Section("Products") {
						if let products = proposal.workingVersion?.products {
							Table(products) {
								TableColumn("Product") { product in
									VStack(alignment: .leading) {
										Text(product.aDescription)
										
										Text(
											product.price,
											format: .currency(code: "USD")
										)
										.foregroundStyle(.secondary)
									}
								}
								
								TableColumn("QTY") { product in
									Text("\(product.quantity)")
								}
								
								TableColumn("Total") { product in
									Text(Double(product.quantity) * product.price, format: .currency(code: "USD"))
								}
								
								TableColumn("") { product in
									Menu {
										Button(
											"Delete",
											systemImage: "trash",
											role: .destructive
										) {
											
										}
									} label: {
										Image(systemName: "ellipsis")
									}
								}
							}
						} else {
							
						}
						
					}
					.headerProminence(.increased)
				}
				.frame(
					maxWidth: .infinity,
					maxHeight: .infinity,
					alignment: .topLeading
				)
				.gridCellColumns(3)
				
				VStack(alignment: .leading) {
					SwiftUI.Section("Customer") {
						
					}
				}
				.frame(
					maxWidth: .infinity,
					maxHeight: .infinity,
					alignment: .topLeading
				)
				.background(Color(uiColor: .systemGray6))
				.gridCellColumns(1)
			}
		}
		.frame(
			maxWidth: .infinity,
			maxHeight: .infinity,
			alignment: .topLeading
		)
		.navigationTitle(proposal.name)
    }
}

//#Preview {
//    ProposalOverview()
//}
