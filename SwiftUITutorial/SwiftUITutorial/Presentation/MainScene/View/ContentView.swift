//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/14.
//

import SwiftUI

struct ContentView: View {
    
    private let landmarkManager: LandmarkManager = .init()
    
    var body: some View {
        LandmarkListView(landmarks: landmarkManager.landmarks)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
