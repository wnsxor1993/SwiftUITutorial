//
//  LandmarkRowView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/17.
//

import SwiftUI

struct LandmarkRowView: View {
    var landmark: LandMark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            
        }
    }
}

struct LandmarkRowView_Previews: PreviewProvider {
    static var previews: some View {
        let landMarkManager: LandmarkManager = .init()
        
        Group {
            LandmarkRowView(landmark: landMarkManager.landmarks![0])
            LandmarkRowView(landmark: landMarkManager.landmarks![1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
