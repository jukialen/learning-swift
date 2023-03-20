//
//  AlaProfileWithMap.swift
//  learning-swift
//
//  Created by Piotr prom on 10/03/2023.
//

import SwiftUI
import MapKit

struct AlaProfileWithMap: View {
  @State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
  
  var landmark: Landmark;
  
  var body: some View {
    VStack {
      Map(coordinateRegion: $region, showsUserLocation: true)
        .accessibilityLabel("Place profile")
        .frame(height: 300)
        .padding(-40)
      
      ImageView(image: landmark.image)
        .padding(.top, -150)
        .frame(height: 120)

      VStack(alignment: .leading) {
        Text("Turtle Rock")
          .font(.title)

        HStack {
          Text("Joshua Tree National Park")
            .font(.subheadline)
          Spacer()
          Text("California")
            .font(.subheadline)
        }
          .font(.subheadline)
          .foregroundColor(.secondary)
        
        Divider()
          .padding(.vertical, 5)
        
        Text("About Turtle Rock")
          .font(.title2)
        Text("Descriptive text goes here.")
    }
    #if os(macOS)
      .padding(.horizontal, 40)
    #endif
      
    #if os(iOS)
      .padding(40)
    #endif

    Spacer()
    }
  }
}

struct AlaProfileWithMap_Previews: PreviewProvider {
  static var previews: some View {
    AlaProfileWithMap(landmark: ModelData().landmarks[0])
  }
}
