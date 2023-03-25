//
//  LandmarkList.swift
//  learning-swift
//
//  Created by Piotr prom on 13/03/2023.
//

import SwiftUI

struct LandmarkList: View {
  @EnvironmentObject var modelData: ModelData;
  @State private var showFavoritesOnly = false;

  var filteredLandmarks: [Landmark] {
    modelData.landmarks.filter { landmark in
      (!showFavoritesOnly || landmark.isFavorite)
    }
}
  
  func setShowFavoritesOnly() {
    showFavoritesOnly = !showFavoritesOnly
  }

  var body: some View {
    List {
      Toggle(isOn: $showFavoritesOnly) {
        Text("Favorites only")
      }
        .padding(.bottom, 0)
      
      ForEach(filteredLandmarks) { landmark in
        NavigationLink {
          LandmarkDetail(landmark: landmark)
            .scaleEffect(showFavoritesOnly ? 1.2 : 1)
            .animation(.easeInOut, value: showFavoritesOnly)
        } label: {
          LandmarkRow(landmark: landmark)
        }
      }
    }
      .navigationTitle("Landmarks")
  }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
      LandmarkList()
        .environmentObject(ModelData())
    }
}
