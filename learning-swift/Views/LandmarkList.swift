//
//  LandmarkList.swift
//  learning-swift
//
//  Created by Piotr prom on 13/03/2023.
//

import SwiftUI

struct LandmarkList: View {
  var body: some View {
    List(landmarks) { landmark in
      NavigationLink {
        LandmarkDetail(landmark: landmark)
      } label: {
        LandmarkRow(landmark: landmark)
      }
    }
      .navigationTitle("Landmarks")
  }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
      LandmarkList()
    }
}
