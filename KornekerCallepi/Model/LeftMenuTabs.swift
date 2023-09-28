//
//  LeftMenuTabs.swift
//  KornekerCallepi
//
//  Created by Ihor Orlenko on 28.09.2023.
//

import Foundation
import SwiftUI

final class LeftMenuTabs: ObservableObject {
    static let tabs: [Tab] = [
        .init(icon: "plus.forwardslash.minus", description: "Add/Substract"),
        .init(icon: "multiply", description: "Multiply"),
        .init(icon: "t.square.fill", description: "Transpose"),
        .init(icon: "d.square.fill", description: "Find determinant"),
        .init(icon: "arrowshape.turn.up.backward", description: "Find inverse"),
        .init(icon: "function", description: "Matrix function"),
        .init(icon: "square.grid.3x3.middle.filled", description: "Solve SLAE"),
    ]
    @Published var currentTab: Tab = tabs[1]
}

struct Tab: Identifiable, Hashable {
    let id = UUID()
    let icon: String
    let description: String
}
