//
//  RotatedBadgeSymbol.swift
//  learning-swift
//
//  Created by Piotr prom on 19/03/2023.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
  let angle: Angle
      
  var body: some View {
    BadgeSymbol()
      .padding(-60)
      .rotationEffect(angle, anchor: .bottom)
  }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
