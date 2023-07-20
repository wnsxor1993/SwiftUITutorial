//
//  HikeManager.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/20.
//

import Foundation
import Combine

final class HikeManager: ObservableObject {
    
    let hikeFileName: String = "hikeData.json"
    @Published var hikes: [Hike] = []
    
    init() {
        self.configureDatas()
    }
}

private extension HikeManager {
    
    func configureDatas() {
        guard let data: Data = JSONFileService.load(hikeFileName) else { return }
        
        let convertService: JSONConvertService<[Hike]> = .init()
        
        if let landmarkArray: [Hike] = convertService.decode(data: data) {
            self.hikes = landmarkArray
        }
    }
}
