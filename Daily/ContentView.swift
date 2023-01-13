//
//  ContentView.swift
//  Daily
//
//  Created by Michael Gillund on 1/6/23.
//

import SwiftUI
import Introspect

struct ContentView: View {
    
    @EnvironmentObject
    private var model: ViewModel
    
    @StateObject
    var gestureManager: InteractionManager = .init()
    
    @State
    var offset: CGFloat = 0
    
    @State
    var current: Tab = pages.first!
    
    @State
    var tapped: Bool = false
    
    @State
    private var settings: Bool = false
    
    @State
    var filter: Bool = false
    
    @State
    var date: Date = Date()
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            ZStack(alignment: .bottom) {
                VStack {
                    DynamicTabHeader(size: size)
                    TabView(selection: $current){
                        ForEach(pages) { tab in
                            GeometryReader { proxy in
                                if tab.isHome == true {
                                    HomeView(date: date)
                                }else{
                                    Text("\(tab.name)")
                                        .font(.largeTitle).bold()
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                            }
                            .ignoresSafeArea()
                            .offsetX { value in
                                if current == tab && !tapped{
                                    offset = value - (size.width * CGFloat(indexOf(tab: tab)))
                                }
                                if value == 0 && tapped{
                                    tapped = false
                                }
                                if tapped && gestureManager.isInteracting{
                                    tapped = false
                                }
                            }
                            .tag(tab)
                        }
                    }
                    .ignoresSafeArea()
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .onAppear(perform: gestureManager.addGesture)
                    .onDisappear(perform: gestureManager.removeGesture)
                }
                .frame(width: size.width, height: size.height)
                FloatingTabBar(settings: $settings)
            }
            .background(Color(.systemGroupedBackground))
        }
        .onChange(of: gestureManager.isInteracting) { newValue in
            
        }
        .sheet(isPresented: $filter) {
            DatePickerView(date: $date)
                .presentationDetents([.fraction(0.4)])
            .introspectViewController{ controller in
                let sheet = controller.presentationController as? UISheetPresentationController
                if let presentation = sheet {
                    presentation.preferredCornerRadius = 35
                }
            }
        }
        .sheet(isPresented: $settings) {
            Text("Settings")
                .introspectViewController{ controller in
                    let sheet = controller.presentationController as? UISheetPresentationController
                    if let presentation = sheet {
                        presentation.preferredCornerRadius = 35
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
