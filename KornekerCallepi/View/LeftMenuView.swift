//
//  LeftMenuView.swift
//  KornekerCallepi
//
//  Created by Ihor Orlenko on 28.09.2023.
//

import SwiftUI

struct LeftMenuView: View {
    
    @ObservedObject var tabManager: LeftMenuTabs
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(LeftMenuTabs.tabs, id: \.self) { tab in
                MenuButton(image: tab.icon, description: tab.description)
            }
        }
        .frame(width: 210)
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(10)
        .background(
            ZStack {
                Color.soloGuitar1
                    .padding(.trailing, 30)
                Color.soloGuitar1
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 0)
            }
        )
    }
    
    @ViewBuilder
    func MenuButton(image: String, description: String)->some View {
        Button {
            tabManager.currentTab = Tab(icon: image, description: description)
        } label: {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(tabManager.currentTab.description == description ? .red : .black)
                    .frame(width: 25, height: 25)
                Text(description)
                    .foregroundStyle(.black)
                    .font(.system(.title2, design: .rounded, weight: .regular))
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundStyle(.black.opacity(0.3))
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    LeftMenuView(tabManager: LeftMenuTabs())
}
