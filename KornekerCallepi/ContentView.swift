//
//  ContentView.swift
//  KornekerCallepi
//
//  Created by Ihor Orlenko on 27.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var leftMenu = LeftMenuTabs()
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                LeftMenuView(tabManager: leftMenu)
                
                Spacer()
                
                switch leftMenu.currentTab.description {
                case "Add/Substract": AddView()
                case "Multiply": MultiplicationView()
                case "Find determinant": DeterminantView()
                case "Find inverse": InverseMatrixView()
                case "Transpose": TransposeView()
                case "Matrix function": MatrixFunctionView()
                case "Solve SLAE": SLAEView()
                default: MultiplicationView()
                }
                
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(
                Color.soloGuitar2
            )
        }
    }
}

#Preview {
    ContentView()
}
