//
//  BadgeView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/20.
//

import SwiftUI

struct BadgeView: View {
    
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotateBadgeSymbolView(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackView()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(
                        1.0 / 4.0,
                        anchor: .top
                    )
                    .position(
                        .init(
                            x: geometry.size.width / 2.0,
                            y: (3.0 / 4.0) * geometry.size.height
                        ))
            }
        }
        .scaledToFit()
    }
}

struct BadgeView_Previews: PreviewProvider {
    
    static var previews: some View {
        BadgeView()
    }
}
