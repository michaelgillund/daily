//
//  BasketballPlayerStatsView.swift
//  Daily
//
//  Created by Michael Gillund on 1/8/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct BasketballPlayerStatsView: View {
    
    let event: Event
    let athlete: BasketballSummaryModel.Boxscore.Player.Statistic.Athlete
    @State var statLabels: [String] = ["PTS","REB","AST","FG","FT","3PT"]
    var isHome: Bool
    
    var body: some View {

        if athlete.didNotPlay == true {
            HStack {
                WebImage(url: athlete.athlete?.headshot?.href)
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .aspectRatio(7/5, contentMode: .fill)
                    .frame(width: 50, height: 50, alignment: .center)
                    .background(isHome == true ? Color(hex: "#\(event.home_color)") : Color(hex: "#\(event.away_color)"))
                    .clipShape(Circle())
                VStack {
                    Text(athlete.athlete?.displayName ?? "")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("DNP")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
            }
            .padding()
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//            .shadow(color: Color(hex: "42474C").opacity(0.06), radius: 4, x: 0, y: 4)
//            .shadow(color: Color(hex: "42474C").opacity(0.32), radius: 0.75, x: 0, y: 0)
        }else {
            HStack {
                WebImage(url: athlete.athlete?.headshot?.href)
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .aspectRatio(7/5, contentMode: .fill)
                    .frame(width: 50, height: 50, alignment: .center)
                    .background(isHome == true ? Color(hex: "#\(event.home_color)") : Color(hex: "#\(event.away_color)"))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5){
                    HStack {
                        Text(athlete.athlete?.displayName ?? "")
                            .font(.headline)
                        if athlete.starter == true{
                            Text(athlete.athlete?.position?.abbreviation ?? "")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        HStack(spacing: 2) {
                            Text(athlete.min)
                                .font(.footnote)
                            Text("MIN")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            ForEach(athlete.stat.indices){ index in
                                Text(athlete.stat[index])
                                    .scaledToFill()
                                    .font(.footnote).bold()
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        HStack {
                            ForEach(statLabels, id: \.self) { stat in
                                Text(stat)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .padding(.leading, -12)
                }
            }
            .padding()
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay(alignment: .leading, content: {
                if event.live == true{
                    if athlete.active == true {
                        Capsule()
                            .fill(.blue)
                            .frame(width: 2, height: 12)
                    }
                    if athlete.ejected == true {
                        Capsule()
                            .fill(.red)
                            .frame(width: 2, height: 12)
                    }
                }
            })
//            .shadow(color: Color(hex: "42474C").opacity(0.06), radius: 4, x: 0, y: 4)
//            .shadow(color: Color(hex: "42474C").opacity(0.32), radius: 0.75, x: 0, y: 0)
        }
    }
}

//struct PlayerStats_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerStats()
//    }
//}
