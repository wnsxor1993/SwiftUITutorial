//
//  MapView.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/17.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    @State private var region: MKCoordinateRegion = .init()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
}

private extension MapView {
    
    func setRegion(_ coordinate: CLLocationCoordinate2D) {
        self.region = .init(
            center: coordinate,
            span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    
    static var previews: some View {
        MapView(coordinate: .init(latitude: 34.011_286, longitude: -116.166_868))
    }
}
