//
//  ImageView.swift
//  learning-swift
//
//  Created by Piotr prom on 10/03/2023.
//

import SwiftUI

struct ImageView: View {
  var image: Image
  
  var body: some View {
      image
        .clipShape(Circle())
        .cornerRadius(0.8)
        .overlay {
          Circle().stroke(.white, lineWidth: 4)
        }
        .shadow(radius: 5)
        .padding(.horizontal, 40)
        .backgroundStyle(Color.clear)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: Image("turtlerock"))
    }
}
