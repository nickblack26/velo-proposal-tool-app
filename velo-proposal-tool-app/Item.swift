//
//  Item.swift
//  velo-proposal-tool-app
//
//  Created by Nick Black on 5/3/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
