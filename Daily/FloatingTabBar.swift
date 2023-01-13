//
//  FloatingTabBar.swift
//  Daily
//
//  Created by Michael Gillund on 1/12/23.
//

import SwiftUI

struct FloatingTabBar: View {
    
    @Binding var settings: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                settings.toggle()
            }, label: {
                ZStack {
                    Text("Settings")
                        .padding(.horizontal)
                        .foregroundColor(.primary)
                        .font(.system(.body, weight: .bold))
                }
                .frame(height: 60)
                .padding(.horizontal)
                .background(.regularMaterial)
                .clipShape(Capsule())
            })
            
        }
        .padding(.horizontal)
    }
}

struct FloatingTabBar_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTabBar(settings: .constant(false))
    }
}
