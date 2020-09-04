//
//  NewsCardView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import RemoteImage

struct NewsCardView: View {
  let news: News
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 25, style: .continuous)
        .fill(Colors.primaryBackground)
        .shadow(radius: 6, x: 0, y: 3)
      
      VStack(alignment: .leading) {
        HStack(alignment: .center, spacing: 20) {
          RemoteImage(type: .url(URL(string: Images.urlExtension + (news.icon ?? ""))!), errorView: { _ in
            ImagePlaceholder()
          }, imageView: { image in
            image
              .resizable()
              .scaledToFit()
          }, loadingView: {
            Indicator()
          })
            .frame(width: 55, height: 30)
          
          Text(news.title)
            .customFont(name: Fonts.shabnam, style: .headline, weight: .bold)
            .foregroundColor(.primary)
        }
        Divider()
        Text(news.description)
          .foregroundColor(.secondary)
          .customFont(name: Fonts.shabnam, style: .body, weight: .regular)
      }
      .padding(20)
    }
    .padding(.vertical, 10)
  }
}

struct NewsCardView_Previews: PreviewProvider {
  static var previews: some View {
    NewsCardView(news: News.example)
  }
}
