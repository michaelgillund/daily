//
//  ScoreView.swift
//  Daily
//
//  Created by Michael Gillund on 1/6/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ScoreView: View {
    
    @Environment(\.colorScheme) var colorScheme

    let event: Event
    
    var body: some View {
        VStack(spacing: 4){
            HStack{
                Text(event.gametime)
                    .foregroundColor(.gray)
                    .font(.system(.footnote, weight: .regular))
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
                }
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
                        .frame(width: 35, height: 35, alignment: .center)
                    
                    if event.post == true {
                        if Int(event.away_score) ?? 0 > Int(event.home_score) ?? 0{
                            Text(event.away_name)
                                .font(.system(.headline ,weight: .heavy))
                        }else if Int(event.away_score) ?? 0 < Int(event.home_score) ?? 0{
                            Text(event.away_name)
                                .foregroundColor(.gray)
                                .font(.system(.headline ,weight: .heavy))
                        }else {
                            Text(event.away_name)
                                .font(.system(.headline ,weight: .heavy))
                        }
                    }else{
                        Text(event.away_name)
                            .font(.system(.headline ,weight: .heavy))
                    }
                    Spacer()
                    if event.post == true {
                        if Int(event.away_score) ?? 0 > Int(event.home_score) ?? 0{
                            Text(event.away_score)
                                .font(.system(.headline ,weight: .heavy))
                        }else if Int(event.away_score) ?? 0 < Int(event.home_score) ?? 0{
                            Text(event.away_score)
                                .foregroundColor(.gray)
                                .font(.system(.headline ,weight: .heavy))
                        }else {
                            Text(event.away_score)
                                .font(.system(.headline ,weight: .heavy))
                        }
                    }else{
                        Text(event.away_score)
                            .font(.system(.headline ,weight: .heavy))
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
                        .frame(width: 35, height: 35, alignment: .center)
                    if event.post == true {
                        if Int(event.home_score) ?? 0 > Int(event.away_score) ?? 0{
                            Text(event.home_name)
                                .font(.system(.headline ,weight: .heavy))
                        }else if Int(event.home_score) ?? 0 < Int(event.away_score) ?? 0{
                            Text(event.home_name)
                                .foregroundColor(.gray)
                                .font(.system(.headline ,weight: .heavy))
                        }else {
                            Text(event.home_name)
                                .font(.system(.headline ,weight: .heavy))
                        }
                    }else{
                        Text(event.home_name)
                            .font(.system(.headline ,weight: .heavy))
                    }
                    
                    Spacer()
                    if event.post == true {
                        if Int(event.home_score) ?? 0 > Int(event.away_score) ?? 0{
                            Text(event.home_score)
                                .font(.system(.headline ,weight: .heavy))
                        }else if Int(event.home_score) ?? 0 < Int(event.away_score) ?? 0{
                            Text(event.home_score)
                                .foregroundColor(.gray)
                                .font(.system(.headline ,weight: .heavy))
                        }else {
                            Text(event.home_score)
                                .font(.system(.headline ,weight: .heavy))
                        }
                    }else {
                        Text(event.home_score)
                            .font(.system(.headline ,weight: .heavy))
                    }
                }
            }
        }
    }
}

//struct ScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreView()
//    }
//}

struct Base: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 4.6, y: 0.2))
        path.addLine(to: CGPoint(x: 1.1, y: 2.4))
        path.addCurve(to: CGPoint(x: 1.1, y: 3.6), control1: CGPoint(x: 0.6, y: 2.6), control2: CGPoint(x: 0.6, y: 3.4))
        path.addLine(to: CGPoint(x: 4.6, y: 5.8))
        path.addCurve(to: CGPoint(x: 5.4, y: 5.8), control1: CGPoint(x: 4.9, y: 5.9), control2: CGPoint(x: 5.1, y: 5.9))
        path.addLine(to: CGPoint(x: 8.9, y: 3.6))
        path.addCurve(to: CGPoint(x: 8.9, y: 2.4), control1: CGPoint(x: 9.4, y: 3.4), control2: CGPoint(x: 9.4, y: 2.6))
        path.addLine(to: CGPoint(x: 5.4, y: 0.2))
        path.addCurve(to: CGPoint(x: 4.6, y: 0.2), control1: CGPoint(x: 5.1, y: 0.1), control2: CGPoint(x: 4.9, y: 0.1))
        path.closeSubpath()
        return path
    }
}
