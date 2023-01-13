//
//  DynamicTabHeader.swift
//  Daily
//
//  Created by Michael Gillund on 1/11/23.
//

import SwiftUI

extension ContentView {
    @ViewBuilder
    func DynamicTabHeader(size: CGSize)->some View{
        HStack {
            HStack(spacing: 0){
                ForEach(pages){tab in
                    if tab.isHome == true {
                        Text(date.formatDates())
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.gray)
                    }else{
                        Text(tab.name)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.gray)
                    }
                    
                }
            }
            .padding(.vertical, 20)
            .overlay(alignment: .leading) {
                Capsule()
                    .fill(.white)
                    .padding(4)
                    .overlay(alignment: .leading, content: {
                        GeometryReader { _ in
                            HStack(spacing: 0){
                                ForEach(pages){tab in
                                    ZStack(alignment: .leading){
                                        if tab.isHome == true {
                                            Button(action: {
                                                haptics()
                                                if tab.isHome == true {
                                                    filter.toggle()
                                                }
                                            }, label: {
                                                Image(systemName: "chevron.down")
                                                    .foregroundColor(.black)
                                                    .font(.system(.body, weight: .heavy))
                                                    .padding(.leading)
                                            })
                                            .disabled(tapped == false)
                                        }
                                        if tab.isHome == true {
                                            Text(date.formatDates())
                                                .fontWeight(.bold)
                                                .frame(maxWidth: .infinity)
                                                .foregroundColor(.black)
                                        }else{
                                            Text(tab.name)
                                                .fontWeight(.bold)
                                                .frame(maxWidth: .infinity)
                                                .foregroundColor(.black)
                                        }
                                        
                                    }
                                    .contentShape(Capsule())
                                    .onTapGesture {
                                        tapped = true
                                        haptics()
                                        withAnimation(.easeInOut){
                                            current = tab
                                            offset = -(size.width) * CGFloat(indexOf(tab: tab))
                                        }
                                    }
                                }
                            }
                            .padding(.vertical, 20)
                            .offset(x: -tabOffset(size: size, padding: 32))
                            
                        }
                        .frame(width: size.width - 32)
                    })
                    .frame(width: (size.width - 32) / CGFloat(pages.count))
                    .mask({
                        Capsule()
                            .background(.blue)
                    })
                    .offset(x: tabOffset(size: size, padding: 32))
                
            }
            .background(.regularMaterial)
            .clipShape(Capsule())
        }
        .padding(.horizontal)
        .padding(.top)
//        .background(Color(.systemGroupedBackground))
        
    }
    
    // MARK: Tab Offset
    func tabOffset(size: CGSize,padding: CGFloat)->CGFloat{
        return (-offset / size.width) * ((size.width - padding) / CGFloat(pages.count))
    }
    
    // MARK: Tab Index
    func indexOf(tab: Tab)->Int{
        let index = pages.firstIndex { CTab in
            CTab == tab
        } ?? 0
        
        return index
    }
    
}
