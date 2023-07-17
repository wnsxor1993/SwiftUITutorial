//
//  LandmarkManager.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/17.
//

import Foundation

final class LandmarkManager {
    
    let landmarkFileName: String = "landmarkData.json"
    var landmarks: [LandMark]?
    
    init() {
        self.configureDatas()
    }
}

private extension LandmarkManager {
    
    func configureDatas() {
        guard let data: Data = JSONFileService.load(landmarkFileName) else { return }
        
        let convertService: JSONConvertService<[LandMark]> = .init()
        self.landmarks = convertService.decode(data: data)
    }
}
