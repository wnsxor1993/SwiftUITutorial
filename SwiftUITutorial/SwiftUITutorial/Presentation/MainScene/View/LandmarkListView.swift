//
//  LandmarkListView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/17.
//

import SwiftUI

struct LandmarkListView: View {
    
    @EnvironmentObject var landmarkManager: LandmarkManager
    @State private var showFavoritesOnly: Bool = false
    
    private var filteredLandmarks: [LandMark] {
        landmarkManager.landmarks.filter {
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
                        DependencyInjection(manager: landmarkManager) {
                            LandmarkDetailView(landmark: landmark)
                        }

                    } label: {
                        LandmarkRowView(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            DependencyInjection(manager: LandmarkManager()) {
                LandmarkListView()
                    .previewDevice(.init(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
        }
    }
}
