//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/14.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var landmarkManager: LandmarkManager
    
    var body: some View {
        LandmarkListView(landmarks: landmarkManager.landmarks)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LandmarkManager())
    }
}
