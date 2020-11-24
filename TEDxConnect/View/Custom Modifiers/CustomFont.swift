//
//  ScaledFont.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/29/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct ScaledFont: ViewModifier {
  @Environment(\.sizeCategory) var sizeCategory
  
  var name: String
  var style: UIFont.TextStyle
  var weight: Font.Weight = .regular
  
  func body(content: Content) -> some View {
    return content.font(Font.custom(
      name,
      size: UIFont.preferredFont(forTextStyle: style).pointSize)
      .weight(weight))
  }
}

extension View {
  func customFont(
    name: String,
    style: UIFont.TextStyle,
    weight: Font.Weight = .regular) -> some View {
    return self.modifier(ScaledFont(name: name, style: style, weight: weight))
  }
}

