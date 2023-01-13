//
//  FootballPlayerStatsView.swift
//  Daily
//
//  Created by Michael Gillund on 1/8/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct FootballPlayerStatsView: View {
    
    let event: Event
    let stat: FootballSummaryModel.Boxscore.Player.Statistic
    var isHome: Bool
    
    var body: some View {
        Text(stat.name?.capitalized ?? "")
            .font(.system(.title3, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
        ForEach(stat.athletes ?? []){ athlete in
            HStack{
                WebImage(url: URL(string: "https://a.espncdn.com/i/headshots/nfl/players/full/\(athlete.athlete?.id ?? "").png"))
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
                    Text(athlete.athlete?.displayName ?? "")
                        .font(.system(.headline, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        ForEach(athlete.stats.prefix(7).indices){ index in
                            Text(athlete.stats[index])
                                .scaledToFill()
                                .font(.footnote).bold()
                                .frame(maxWidth: .infinity)
                        }
                    }
                    HStack{
                        ForEach(stat.labels.prefix(7).indices) { index in
                            Text(stat.labels[index])
                                .scaledToFill()
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            .padding()
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//            .shadow(color: Color(hex: "42474C").opacity(0.06), radius: 4, x: 0, y: 4)
//            .shadow(color: Color(hex: "42474C").opacity(0.32), radius: 0.75, x: 0, y: 0)
        }
    }
}

//struct NFLPlayerStats_Previews: PreviewProvider {
//    static var previews: some View {
//        NFLPlayerStats()
//    }
//}
