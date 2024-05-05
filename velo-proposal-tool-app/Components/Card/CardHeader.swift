//
//  CardHeader.swift
//  velo-proposal-tool-app
//
//  Created by Nick Black on 5/3/24.
//

import SwiftUI

struct CardHeader: View {
	var title: String?
	var description: String?
	
    var body: some View {
		VStack(
			alignment: .leading,
			spacing: 6
		) {
			if title != nil {
				Text(title!)
					.fontWeight(.semibold)
					.tracking(-0.4)
					.multilineTextAlignment(.center)
					.lineLimit(4)
					.allowsTightening(true)
			}
			
			if description != nil {
				Text(description!)
					.font(.callout)
					.foregroundStyle(.secondary)
			}
		}
		.padding(24)
    }
}

#Preview {
    CardHeader(title: "Testing", description: "Testing")
}
