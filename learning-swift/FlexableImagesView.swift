//
//  FlexableImagesView.swift
//  learning-swift
//
//  Created by Piotr prom on 10/03/2023.
//

import SwiftUI

struct FlexableImagesView: View {
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
            ImageView()
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

struct FlexableImagesView_Previews: PreviewProvider {
  static var previews: some View {
    FlexableImagesView()
  }
}
