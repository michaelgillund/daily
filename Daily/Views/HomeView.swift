//
//  HomeView.swift
//  Daily
//
//  Created by Michael Gillund on 1/6/23.
//

import SwiftUI
import Introspect

struct HomeView: View {
    
    @EnvironmentObject
    private var model: ViewModel
    
    @State
    private var event: Event? = nil
    
    let date: Date
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(model.sections) { section in
                Section(header:
                    HStack {
                    Text(section.title)
                        .font(.system(size: 30, weight: .heavy))
                        Spacer()
                    }
                    .padding()
                , content: {
                    ForEach(section.sports?.sorted(by: {$0.sorted < $1.sorted}) ?? []) { sport in
                        ScoreView(event: sport)
                            .padding()
                            .background(Color(.secondarySystemGroupedBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//                            .shadow(color: Color(hex: "42474C").opacity(0.06), radius: 4, x: 0, y: 4)
//                            .shadow(color: Color(hex: "42474C").opacity(0.32), radius: 0.75, x: 0, y: 0)
                            .onTapGesture{
                                haptics()
                                self.event = sport
                            }
                    }
                    
                    .padding(.bottom, 6)
                    .padding(.horizontal)
                })
            }
            Rectangle()
                .padding()
                .foregroundColor(.clear)
                .frame(height: 100)
        }
        .background(Color(.systemGroupedBackground))
        .refreshable {
            await self.model.fetch()
        }
        .sheet(item: $event){ event in
            SummaryView(event: event)
                .introspectViewController{ controller in
                    let sheet = controller.presentationController as? UISheetPresentationController
                    if let presentation = sheet {
                        presentation.preferredCornerRadius = 35
                    }
                }
        }
    }
}
    

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(date: Date())
            .environmentObject(ViewModel())
    }
}
