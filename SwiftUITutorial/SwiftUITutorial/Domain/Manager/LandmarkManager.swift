//
//  LandmarkManager.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/17.
//

import Foundation
import Combine

final class LandmarkManager: ObservableObject {
    
    let landmarkFileName: String = "landmarkData.json"
    @Published var landmarks: [LandMark] = []
    
    init() {
        self.configureDatas()
    }
}

private extension LandmarkManager {
    
    func configureDatas() {
        guard let data: Data = JSONFileService.load(landmarkFileName) else { return }
        
        let convertService: JSONConvertService<[LandMark]> = .init()
        
        if let landmarkArray: [LandMark] = convertService.decode(data: data) {
            self.landmarks = landmarkArray
        }
    }
}
