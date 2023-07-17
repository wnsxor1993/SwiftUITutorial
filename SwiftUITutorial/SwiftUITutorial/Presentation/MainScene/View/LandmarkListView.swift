//
//  LandmarkListView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/17.
//

import SwiftUI

struct LandmarkListView: View {
    
    private let landmarks: [LandMark]
    @State private var showFavoritesOnly: Bool = false
    
    private var filteredLandmarks: [LandMark] {
        landmarks.filter {
            (!showFavoritesOnly || $0.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)

                    } label: {
                        LandmarkRowView(landmark: landmark)
                    }
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
