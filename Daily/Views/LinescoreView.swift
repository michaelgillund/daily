//
//  LinescoreView.swift
//  Daily
//
//  Created by Michael Gillund on 1/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct LinescoreView: View {
    
    @Environment(\.colorScheme) var colorScheme
    let event: Event
    
    var body: some View {
        VStack{
            HStack{
                Text("Scoring")
                    .font(.system(.body, weight: .bold))
                Spacer()
                ForEach(event.away_linescore.indices){ index in
                        Text("\(index + 1)")
                            .foregroundColor(.gray)
                            .font(.system(.footnote, weight: .regular))
                            .frame(width: 25)
                    }
                Text("T")
                    .foregroundColor(.gray)
                    .font(.system(.footnote, weight: .regular))
                    .frame(width: 25)
            }
            HStack{
                WebImage(url: URL(string: colorScheme == .dark ? event.away_image_dark : event.away_image))
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: .center)
                Text(event.away_abv)
                    .font(.system(.footnote, weight: .regular))
                Spacer()
                ForEach(event.away_linescore){ index in
                    Text("\(index.value ?? 0)")
                        .tag(index.value)
                        .font(.system(.footnote, weight: .regular))
                        .frame(width: 25)
                }
                Text(event.away_score)
                    .font(.system(.footnote, weight: .regular))
                    .frame(width: 25)
            }
            HStack{
                WebImage(url: URL(string: colorScheme == .dark ? event.home_image_dark : event.home_image))
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: .center)
                Text(event.home_abv)
                    .font(.system(.footnote, weight: .regular))
                Spacer()
                ForEach(event.home_linescore){ index in
                    Text("\(index.value ?? 0)")
                        .tag(index.value)
                        .font(.system(.footnote, weight: .regular))
                        .frame(width: 25)
                }
                Text(event.home_score)
                    .font(.system(.footnote, weight: .regular))
                    .frame(width: 25)
            }
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//        .shadow(color: Color(hex: "42474C").opacity(0.06), radius: 4, x: 0, y: 4)
//        .shadow(color: Color(hex: "42474C").opacity(0.32), radius: 0.75, x: 0, y: 0)
    }
}

//struct LinescoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        LinescoreView()
//    }
//}
