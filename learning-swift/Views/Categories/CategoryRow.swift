//
//  CategoryRow.swift
//  learning-swift
//
//  Created by Piotr prom on 27/03/2023.
//

import SwiftUI

struct CategoryRow: View {
  var categoryName: String
  var items: [Landmark]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(categoryName)
        .font(.headline)
        .padding(.top, 5)
        .padding(.leading, 15)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 0) {
          ForEach(items) { landmark in
            NavigationLink {
              LandmarkDetail(landmark: landmark)
            } label: {
              CategoryItem(landmark: landmark)
            }
          }
        }
      }
        .frame(height: 185)
    }
    
    
  }
}

struct CategoryRow_Previews: PreviewProvider {
  static var landmarks = ModelData().landmarks

  static var previews: some View {
    CategoryRow(
      categoryName: landmarks[0].category.rawValue,
      items: Array(landmarks.prefix(4))
    )
  }
}
