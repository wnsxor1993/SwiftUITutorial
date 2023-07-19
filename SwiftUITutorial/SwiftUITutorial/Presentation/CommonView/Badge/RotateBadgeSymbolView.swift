//
//  RotateBadgeSymbolView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/19.
//

import SwiftUI

struct RotateBadgeSymbolView: View {
    
    let angle: Angle
    
    var body: some View {
        BadgeSymbolView()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotateBadgeSymbolView_Previews: PreviewProvider {
    
    static var previews: some View {
        RotateBadgeSymbolView(angle: .degrees(5))
    }
}
