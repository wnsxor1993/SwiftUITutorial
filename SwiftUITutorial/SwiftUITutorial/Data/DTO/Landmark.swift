//
//  File.swift
//  LandMark
//
//  Created by Zeto on 2023/07/17.
//

import Foundation
import SwiftUI
import CoreLocation

// TODO: Foundation 외의 모듈 제거 방향
struct LandMark: Hashable, Codable {
    
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        return .init(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        return .init(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
