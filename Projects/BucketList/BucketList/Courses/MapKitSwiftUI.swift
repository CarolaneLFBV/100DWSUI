//
//  MapKitSwiftUI.swift
//  BucketList
//
//  Created by Carolane LEFEBVRE on 10/08/2023.
//

import SwiftUI
import MapKit

struct Location1: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapKitSwiftUI: View {
    @State private var mapRegion1 = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location1(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location1(name: "London's Tower", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapRegion1, annotationItems: locations) { location in
                // Other possibility
                // MapMarker(coordinate: location.coordinate)
                
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 44, height: 44)
                    }
                }
            }
            .navigationTitle("London Explorer")
            .ignoresSafeArea()
        }
    }
}

struct MapKitSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        MapKitSwiftUI()
    }
}

