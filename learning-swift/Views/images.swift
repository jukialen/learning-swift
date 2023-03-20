//
//  images.swift
//  learning-swift
//
//  Created by Piotr prom on 07/03/2023.
//

import SwiftUI

struct images: View {
  var landmark: Landmark;
  
  var body: some View {
    VStack  {
      ScrollView {
        Text("My images")
          .frame(maxWidth: .infinity - 50, alignment: .leading)
          .font(.title)
          .multilineTextAlignment(.leading)
          .backgroundStyle(Color.clear)
          .foregroundColor(.black)
          .padding(.leading, 60.0)
          .padding(.bottom, 40)

        Spacer()

        ForEach(0 ..< 5) { item in
          HStack {
            ImageView(image: landmark.image)
          }
        }
      }
      
      Spacer(minLength: 5)
    }
      .background(
        ZStack {
          Image ( "pexels-riccardo-bertolo-4245826")
            .resizable ()
            .scaledToFill ()
            .edgesIgnoringSafeArea (.all)
            .blur(radius: 20)
            .frame(maxWidth: .infinity)
        }
      )
  }
}

struct images_Previews: PreviewProvider {
    static var previews: some View {
      images(landmark: ModelData().landmarks[0])
    }
}
