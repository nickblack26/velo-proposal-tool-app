//
//  CardContent.swift
//  velo-proposal-tool-app
//
//  Created by Nick Black on 5/3/24.
//

import SwiftUI

struct CardContent<Content: View>: View {
	@ViewBuilder var content: Content
	
    var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			content
		}
		.padding([.bottom, .horizontal], 24)
    }
}

#Preview {
	CardContent {
		
	}
}
