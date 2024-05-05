//
//  Input.swift
//  velo-proposal-tool-app
//
//  Created by Nick Black on 5/3/24.
//

import SwiftUI

struct Input: View {
	@State private var text: String = ""
	var label: String?
	var description: String?
	var prompt: String?
	
    var body: some View {
		VStack(alignment: .leading, spacing: 6) {
			if label != nil {
				Text(label!)
					.fontWeight(.medium)
			}
			
			if prompt != nil {
				TextField(label ?? "", text: $text, prompt: Text(prompt ?? ""))
					.textFieldStyle(.roundedBorder)
			} else {
				TextField(label ?? "", text: $text)
					.textFieldStyle(.roundedBorder)
			}
			
			if description != nil {
				Text(description!)
					.font(.callout)
					.foregroundStyle(.secondary)
			}
		}
    }
}

#Preview {
    Input(label: "Name", description: "Testing")
}
