//
//  LandmarkDetail.swift
//  learning-swift
//
//  Created by Piotr prom on 14/03/2023.
//

import SwiftUI

struct LandmarkDetail: View {
  @EnvironmentObject var modelData: ModelData;

  var landmark: Landmark;

  var landmarkIndex: Int {
    modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
  }
  
  var body: some View {
    ScrollView {
      MapView(coordinate: landmark.locationCoordinate)
        .ignoresSafeArea(edges: .top)
        .frame(height: 300)
      
      ImageView(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)
      
      VStack(alignment: .leading) {
        HStack {
          Text(landmark.name)
            .font(.title)
          FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
            .scaleEffect(modelData.landmarks[landmarkIndex].isFavorite ? 1.2 : 1)
            .animation(.easeInOut, value: modelData.landmarks[landmarkIndex].isFavorite)
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
    }
      .navigationTitle(landmark.name)
    #if os(iOS)
      .navigationBarTitleDisplayMode(.inline)
    #endif
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
  static let modelData = ModelData()

  static var previews: some View {
    LandmarkDetail(landmark: ModelData().landmarks[0])
      .environmentObject(modelData)
  }
}
