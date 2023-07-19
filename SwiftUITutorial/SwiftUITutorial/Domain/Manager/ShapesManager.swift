//
//  ShapesManager.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/17.
//

import CoreGraphics

// MARK: 다양한 도형 생성 객체
class ShapesManager {
    
    enum Shape {
        case hexagon
    }
    
    private let shape: Shape
    
    private(set) var segments: [Segment] = []
    private(set) var adjustment: CGFloat = 0
    
    init(shape: Shape) {
        self.shape = shape
        
        switch shape {
        case .hexagon:
            self.configureHexagon()
        }
    }
}

// MARK: Hexagon
private extension ShapesManager {
    
    func configureHexagon() {
        self.configureHexagonAdjustment()
        self.configureHexagonSegments()
    }
    
    func configureHexagonAdjustment() {
        self.adjustment = 0.085
    }
    
    func configureHexagonSegments() {
        self.segments = [
            Segment(
                line: CGPoint(x: 0.60, y: 0.05),
                curve: CGPoint(x: 0.40, y: 0.05),
                control: CGPoint(x: 0.50, y: 0.00)
            ),
            Segment(
                line: CGPoint(x: 0.05, y: 0.20 + adjustment),
                curve: CGPoint(x: 0.00, y: 0.30 + adjustment),
                control: CGPoint(x: 0.00, y: 0.25 + adjustment)
            ),
            Segment(
                line: CGPoint(x: 0.00, y: 0.70 - adjustment),
                curve: CGPoint(x: 0.05, y: 0.80 - adjustment),
                control: CGPoint(x: 0.00, y: 0.75 - adjustment)
            ),
            Segment(
                line: CGPoint(x: 0.40, y: 0.95),
                curve: CGPoint(x: 0.60, y: 0.95),
                control: CGPoint(x: 0.50, y: 1.00)
            ),
            Segment(
                line: CGPoint(x: 0.95, y: 0.80 - adjustment),
                curve: CGPoint(x: 1.00, y: 0.70 - adjustment),
                control: CGPoint(x: 1.00, y: 0.75 - adjustment)
            ),
            Segment(
                line: CGPoint(x: 1.00, y: 0.30 + adjustment),
                curve: CGPoint(x: 0.95, y: 0.20 + adjustment),
                control: CGPoint(x: 1.00, y: 0.25 + adjustment)
            )
        ]
    }
}
