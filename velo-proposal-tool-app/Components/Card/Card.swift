//
//  Card.swift
//  velo-proposal-tool-app
//
//  Created by Nick Black on 5/3/24.
//

import SwiftUI

struct Card<Content: View>: View {
	@ViewBuilder var content: Content
	
    var body: some View {
		VStack(alignment: .leading) {
			content
		}
		.background(
			RoundedRectangle(cornerRadius: 12)
				.fill(.background)
				.stroke(
					.border,
					style: .init(lineWidth: 1)
				)
		)
		.shadow(radius: 1)
		.shadow(radius: 1)
    }
}

#Preview {
	Card {
		CardHeader(
			title: "Create project",
			description: "Deploy your new project in one-click."
		)
		
		CardContent {
			Input(label: "Name", prompt: "Name of your project")
			
			Input(label: "Framework", prompt: "Name of your project")
		}
		
		CardFooter {
			Button("Cancel") {
				
			}
			.buttonStyle(.borderedProminent)
			.tint(.white)
			
			Spacer()
			
			Button("Deploy") {
				
			}
			.buttonStyle(.borderedProminent)
		}
	}
	.frame(minWidth: 500, minHeight: 500)
}
