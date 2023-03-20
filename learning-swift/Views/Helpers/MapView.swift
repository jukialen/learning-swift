//
//  MapView.swift
//  learning-swift
//
//  Created by Piotr prom on 09/03/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
  @State private var region = MKCoordinateRegion()
  
  var coordinate: CLLocationCoordinate2D

  private func setRegion(_ coordinate: CLLocationCoordinate2D) {
    region = MKCoordinateRegion(
      center: coordinate,
      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
  }
  
  var body: some View {
    Map(coordinateRegion: $region)
      .accessibilityLabel("Place")
      .padding(.top, -40)
      .onAppear {
        setRegion(coordinate)
      }
        .edgesIgnoringSafeArea(.top)
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
  }
}
