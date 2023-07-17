//
//  LandmarkDetailView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/17.
//

import SwiftUI

struct LandmarkDetailView: View {
    
    @EnvironmentObject var landMarkManager: LandmarkManager
    var landmark: LandMark
    var landmarkIndex: Int? {
        landMarkManager.landmarks.firstIndex {
            $0.id == self.landmark.id
        }
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImageView(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    if let landmarkIndex {
                        FavoriteButtonView(isSet: $landMarkManager.landmarks[landmarkIndex].isFavorite)
                    }
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    
    static let landMarkManager: LandmarkManager = .init()
    
    static var previews: some View {
        LandmarkDetailView(landmark: landMarkManager.landmarks[0])
            .environmentObject(landMarkManager)
    }
}
