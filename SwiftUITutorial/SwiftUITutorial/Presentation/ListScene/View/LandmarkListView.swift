//
//  LandmarkListView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/17.
//

import SwiftUI

struct LandmarkListView: View {
    
    private let landmarkManager: LandmarkManager = .init()
    
    var body: some View {
        List(landmarkManager.landmarks) { landmark in
            LandmarkRowView(landmark: landmark)
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
    }
}
