//
//  Hike.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/20.
//

import Foundation

struct Hike: Codable, Hashable {
    
    let id: Int
    let name: String
    let distance: Double
    let difficulty: Int
    let observations: [Observation]
    
    static var formatter: LengthFormatter = .init()
    
    var distanceText: String {
        Self.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable {
        
        var distanceFromStart: Double
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
