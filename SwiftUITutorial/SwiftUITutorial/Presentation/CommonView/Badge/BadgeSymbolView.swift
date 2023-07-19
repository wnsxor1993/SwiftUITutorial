//
//  BadgeSymbolView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/19.
//

import SwiftUI

struct BadgeSymbolView: View {
    
    var body: some View {
        GeometryReader { geometry in
            self.configureTrianglePath(with: geometry)
                .fill(Color.tutorialBlue)
        }
    }
}

private extension BadgeSymbolView {
    
    func configureTrianglePath(with geometry: GeometryProxy) -> Path {
        let width = min(geometry.size.width, geometry.size.height)
        let height = width * 0.75
        let spacing = width * 0.030
        let middle = width * 0.5
        let topWidth = width * 0.226
        let topHeight = height * 0.4
        
        let trianglePath: Path = .init {
            $0.addLines([
                CGPoint(x: middle, y: spacing),
                CGPoint(x: middle - topWidth, y: topHeight - spacing),
                CGPoint(x: middle, y: topHeight / 2 + spacing),
                CGPoint(x: middle + topWidth, y: topHeight - spacing),
                CGPoint(x: middle, y: spacing)
            ])
            
            $0.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
            $0.addLines([
                CGPoint(x: middle - topWidth, y: topHeight + spacing),
                CGPoint(x: spacing, y: height - spacing),
                CGPoint(x: width - spacing, y: height - spacing),
                CGPoint(x: middle + topWidth, y: topHeight + spacing),
                CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
            ])
        }
        
        return trianglePath
    }
}

struct BadgeSymbolView_Previews: PreviewProvider {
    
    static var previews: some View {
        BadgeSymbolView()
    }
}
