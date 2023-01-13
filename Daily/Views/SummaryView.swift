//
//  SummaryView.swift
//  Daily
//
//  Created by Michael Gillund on 1/6/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct SummaryView: View {
    
    @Environment(\.colorScheme) var colorScheme

    let event: Event
    
    @State
    var nba: BasketballSummaryModel.Boxscore? = nil
    
    @State
    var nfl: FootballSummaryModel.Boxscore? = nil
    
    @State
    private var NBAselection = 0
    
    @State
    private var NFLselection = 0
  
 
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false){
                VStack {
                    HStack{
                        Text(event.gametime)
                            .foregroundColor(.gray)
                            .font(.system(.headline, weight: .regular))
                        Spacer()
                        HStack{
                            if event.league.hasPrefix("baseball") {
                                if event.live == true {
                                    HStack{
                                        VStack(spacing: -1) {
                                            if event.second_base == true {
                                                Base()
                                                    .fill(.blue)
                                                    .frame(width: 10, height: 6)
                                            }else{
                                                Base()
                                                    .fill(.gray)
                                                    .frame(width: 10, height: 6)
                                            }
                                            HStack(spacing: 1){
                                                if event.third_base == true {
                                                    Base()
                                                        .fill(.blue)
                                                        .frame(width: 10, height: 6)
                                                }else{
                                                    Base()
                                                        .fill(.gray)
                                                        .frame(width: 10, height: 6)
                                                }
                                                if event.first_base == true {
                                                    Base()
                                                        .fill(.blue)
                                                        .frame(width: 10, height: 6)
                                                }else{
                                                    Base()
                                                        .fill(.gray)
                                                        .frame(width: 10, height: 6)
                                                }
                                            }
                                        }
                                    }
                                    if event.outs.hasPrefix("0"){
                                        HStack(spacing: 2){
                                            Circle()
                                                .foregroundColor(.gray)
                                                .frame(width: 5 ,height: 5)
                                            Circle()
                                                .foregroundColor(.gray)
                                                .frame(width: 5 ,height: 5)
                                            Circle()
                                                .foregroundColor(.gray)
                                                .frame(width: 5 ,height: 5)
                                        }
                                    }else if event.outs.hasPrefix("1"){
                                        HStack(spacing: 2){
                                            Circle()
                                                .foregroundColor(.blue)
                                                .frame(width: 5 ,height: 5)
                                            Circle()
                                                .foregroundColor(.gray)
                                                .frame(width: 5 ,height: 5)
                                            Circle()
                                                .foregroundColor(.gray)
                                                .frame(width: 5 ,height: 5)
                                        }
                                        
                                    }else if event.outs.hasPrefix("2"){
                                        HStack(spacing: 2){
                                            Circle()
                                                .foregroundColor(.blue)
                                                .frame(width: 5 ,height: 5)
                                            Circle()
                                                .foregroundColor(.blue)
                                                .frame(width: 5 ,height: 5)
                                            Circle()
                                                .foregroundColor(.gray)
                                                .frame(width: 5 ,height: 5)
                                        }
                                        
                                    }else if event.outs.hasPrefix("3"){
                                        HStack(spacing: 2){
                                            Circle()
                                                .foregroundColor(.blue)
                                                .frame(width: 5 ,height: 5)
                                            Circle()
                                                .foregroundColor(.blue)
                                                .frame(width: 5 ,height: 5)
                                            Circle()
                                                .foregroundColor(.blue)
                                                .frame(width: 5 ,height: 5)
                                        }
                                        
                                    }
                                }
                            }
                        }//Baseball Only
                    }
                    VStack(spacing: 4){
                        HStack{
                            WebImage(url: URL(string: colorScheme == .dark ? event.away_image_dark : event.away_image))
                                .resizable()
                                .placeholder {
                                    ProgressView()
                                }
                                .indicator(.activity)
                                .transition(.fade(duration: 0.5))
                                .scaledToFit()
                                .frame(width: 50, height: 50, alignment: .center)
                            
                            if event.post == true {
                                if Int(event.away_score) ?? 0 > Int(event.home_score) ?? 0{
                                    Text(event.away_name)
                                        .font(.system(.title2 ,weight: .heavy))
                                }else if Int(event.away_score) ?? 0 < Int(event.home_score) ?? 0{
                                    Text(event.away_name)
                                        .foregroundColor(.gray)
                                        .font(.system(.title2 ,weight: .heavy))
                                }else {
                                    Text(event.away_name)
                                        .font(.system(.title2 ,weight: .heavy))
                                }
                            }else{
                                Text(event.away_name)
                                    .font(.system(.title2 ,weight: .heavy))
                            }
                            Spacer()
                            if event.post == true {
                                if Int(event.away_score) ?? 0 > Int(event.home_score) ?? 0{
                                    Text(event.away_score)
                                        .font(.system(.title2 ,weight: .heavy))
                                }else if Int(event.away_score) ?? 0 < Int(event.home_score) ?? 0{
                                    Text(event.away_score)
                                        .foregroundColor(.gray)
                                        .font(.system(.title2 ,weight: .heavy))
                                }else {
                                    Text(event.away_score)
                                        .font(.system(.title2 ,weight: .heavy))
                                }
                            }else{
                                Text(event.away_score)
                                    .font(.system(.title2 ,weight: .heavy))
                            }
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
                                .frame(width: 50, height: 50, alignment: .center)
                            if event.post == true {
                                if Int(event.home_score) ?? 0 > Int(event.away_score) ?? 0{
                                    Text(event.home_name)
                                        .font(.system(.title2 ,weight: .heavy))
                                }else if Int(event.home_score) ?? 0 < Int(event.away_score) ?? 0{
                                    Text(event.home_name)
                                        .foregroundColor(.gray)
                                        .font(.system(.title2 ,weight: .heavy))
                                }else {
                                    Text(event.home_name)
                                        .font(.system(.title2 ,weight: .heavy))
                                }
                            }else{
                                Text(event.home_name)
                                    .font(.system(.title2 ,weight: .heavy))
                            }
                            
                            Spacer()
                            if event.post == true {
                                if Int(event.home_score) ?? 0 > Int(event.away_score) ?? 0{
                                    Text(event.home_score)
                                        .font(.system(.title2 ,weight: .heavy))
                                }else if Int(event.home_score) ?? 0 < Int(event.away_score) ?? 0{
                                    Text(event.home_score)
                                        .foregroundColor(.gray)
                                        .font(.system(.title2 ,weight: .heavy))
                                }else {
                                    Text(event.home_score)
                                        .font(.system(.title2 ,weight: .heavy))
                                }
                            }else {
                                Text(event.home_score)
                                    .font(.system(.title2 ,weight: .heavy))
                            }
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemGroupedBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//                    .shadow(color: Color(hex: "42474C").opacity(0.06), radius: 4, x: 0, y: 4)
//                    .shadow(color: Color(hex: "42474C").opacity(0.32), radius: 0.75, x: 0, y: 0)
                    
                    if event.pre != true{
                        
                        LinescoreView(event: event)
                        
                        if event.league == "basketball" {
                            VStack{
                                SegmentedPicker(items: ["\(event.away_abv)","\(event.home_abv)"], selection: self.$NBAselection)
                                if NBAselection == 0 { //AWAY
                                    Text("Starter")
                                        .font(.system(.title3, weight: .bold))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    ForEach(nba?.players?[0].statistics?[0].athletes?.filter({ $0.starter == true}) ?? []) { athlete in
                                        BasketballPlayerStatsView(event: event, athlete: athlete, isHome: false)
                                    }
                                    Text("Bench")
                                        .font(.system(.title3, weight: .bold))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    ForEach(nba?.players?[0].statistics?[0].athletes?.filter({ $0.starter == false}) ?? []) { athlete in
                                        BasketballPlayerStatsView(event: event, athlete: athlete, isHome: false)
                                    }
                                }else if NBAselection == 1 { //HOME
                                    Text("Starter")
                                        .font(.system(.title3, weight: .bold))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    ForEach(nba?.players?[1].statistics?[0].athletes?.filter({ $0.starter == true}) ?? []) { athlete in
                                        BasketballPlayerStatsView(event: event, athlete: athlete, isHome: true)
                                    }
                                    Text("Bench")
                                        .font(.system(.title3, weight: .bold))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    ForEach(nba?.players?[1].statistics?[0].athletes?.filter({ $0.starter == false}) ?? []) { athlete in
                                        BasketballPlayerStatsView(event: event, athlete: athlete, isHome: true)
                                    }
                                }
                                
                            }
                        }
        
                        if event.league == "football" {
                            VStack{
                                SegmentedPicker(items: ["\(event.away_abv)","\(event.home_abv)"], selection: self.$NFLselection)
                                if NFLselection == 0{
                                    ForEach(nfl?.players?[0].statistics?.prefix(3) ?? []) { stat in
                                        FootballPlayerStatsView(event: event, stat: stat, isHome: false)
                                    }
                                }else if NFLselection == 1 {
                                    ForEach(nfl?.players?[1].statistics?.prefix(3) ?? []) { stat in
                                        FootballPlayerStatsView(event: event, stat: stat, isHome: true)
                                    }
                                }
                            }
                        }
                    }
                }
                .ignoresSafeArea()
                .padding(.horizontal)
            }
            .navigationBarTitle("Summary")
            .background(Color(.systemGroupedBackground))
            .task {
                await self.request(id: event.id)
            }
        }
    }
    func request(id: String) async {
        do{
            if event.league == "basketball"{
                async let NBARequest: BasketballSummaryModel = Network.shared.get(url: "https://site.api.espn.com/apis/site/v2/sports/basketball/nba/summary?event=\(id)")
            
                let nba = try await NBARequest.boxscore
                self.nba = nba
                
            }else if event.league == "football" {
                async let NFLRequest: FootballSummaryModel = Network.shared.get(url: "https://site.api.espn.com/apis/site/v2/sports/football/nfl/summary?event=\(id)")
            
                let nfl = try await NFLRequest.boxscore
                self.nfl = nfl
            }

        }catch let error {
            print(error)
        }
    }
}

//struct SummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SummaryView()
//    }
//}


