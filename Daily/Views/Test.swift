//
//  Test.swift
//  Daily
//
//  Created by Michael Gillund on 1/12/23.
//

import SwiftUI

struct Test: View {
    @State var offset = CGSize(width: 0, height: 0)

    var body: some View {
      ScrollView {
            VStack(spacing: 50) {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .offset(self.offset)
                    .animation(.linear)
                Button(action: {
                    self.offset.width += 66
                })
                {
                    Text("Animate me")
                }
            }.frame(width: 300)
      }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
