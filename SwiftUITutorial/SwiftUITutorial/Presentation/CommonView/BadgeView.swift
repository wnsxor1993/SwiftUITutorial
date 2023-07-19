//
//  BadgeView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/19.
//

import SwiftUI

struct BadgeView: View {
    
    private let hexagonManager: ShapesManager = .init(shape: .hexagon)
    
    var body: some View {
        GeometryReader { geometry in
            self.configureHexagonPath(with: geometry)
            .fill(.linearGradient(
                .init(colors: [.tutorialPink, .tutorialOrange]),
                startPoint: .init(x: 0.5, y: 0),
                endPoint: .init(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

private extension BadgeView {
    
    func configureHexagonPath(with geometry: GeometryProxy) -> Path {
        var width: CGFloat = min(geometry.size.width, geometry.size.height)
        let height: CGFloat = width
        let xScale: CGFloat = 0.832
        let xOffset: CGFloat = (width * (1.0 - xScale)) / 2.0
        
        let hexagonPath: Path = .init { path in
            width *= xScale
            
            path.move(
                to: .init(
                    x: width * 0.95 + xOffset,
                    y: height * (0.20 + hexagonManager.adjustment)
                )
            )
            
            hexagonManager.segments.forEach {
                path.addLine(
                    to: .init(
                        x: width * $0.line.x + xOffset,
                        y: height * $0.line.y
                    )
                )
                
                path.addQuadCurve(
                    to: .init(
                        x: width * $0.curve.x + xOffset,
                        y: height * $0.curve.y
                    ),
                    control: .init(
                        x: width * $0.control.x + xOffset,
                        y: height * $0.control.y
                    )
                )
            }
        }
        
        return hexagonPath
    }
}

struct BadgeView_Previews: PreviewProvider {
    
    static var previews: some View {
        BadgeView()
    }
}
