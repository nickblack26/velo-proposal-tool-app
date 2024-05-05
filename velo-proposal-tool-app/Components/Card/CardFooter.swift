//
//  CardFooter.swift
//  velo-proposal-tool-app
//
//  Created by Nick Black on 5/3/24.
//

import SwiftUI

struct CardFooter<Content: View>: View {
	@ViewBuilder var content: Content
	
    var body: some View {
		HStack {
			content
		}
		.padding([.horizontal, .bottom], 24)
    }
}

#Preview {
	CardFooter {
		Button("Cancel") {
			
		}
		.buttonStyle(.borderedProminent)
		
		Spacer()
		
		Button("Deploy") {
			
		}
		.buttonStyle(.borderedProminent)
	}
}
