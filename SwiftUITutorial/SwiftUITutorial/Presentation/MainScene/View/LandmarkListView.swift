//
//  LandmarkListView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/17.
//

import SwiftUI

struct LandmarkListView: View {
    
    private let landmarks: [LandMark]
    
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetailView(landmark: landmark)
                    
                } label: {
                    LandmarkRowView(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
    
    init(landmarks: [LandMark]) {
        self.landmarks = landmarks
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    
    static var previews: some View {
        let landMarkManager: LandmarkManager = .init()
        
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkListView(landmarks: landMarkManager.landmarks)
                .previewDevice(.init(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
