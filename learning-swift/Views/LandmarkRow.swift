//
//  LandmarkRow.swift
//  learning-swift
//
//  Created by Piotr prom on 13/03/2023.
//

import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark

  var body: some View {
    HStack {
      landmark.image
        .resizable()
        .frame(width: 50, height: 50)
        .background(.blue)
      Text(landmark.name)

      Spacer()
    }
  }
}

struct LandmarkRow_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkRow(landmark: landmarks[0])
  }
}
