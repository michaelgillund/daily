//
//  DatePickerView.swift
//  Daily
//
//  Created by Michael Gillund on 1/12/23.
//

import SwiftUI

struct DatePickerView: View {
    
    @EnvironmentObject
    private var model: ViewModel
    
    @Binding var date: Date
    
    var body: some View {
        VStack{
            Spacer()
            DatePicker(
                "",
                selection: $date,
                displayedComponents: [.date]
            )
            .labelsHidden()
            .datePickerStyle(.graphical)
            .onChange(of: date, perform: { (value) in
                Task {
                    self.model.date = date
                    await self.model.fetch()
                }
            })
            .padding()
            .frame(width: 320)
//            .background(.regularMaterial)
//            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        }
        .padding()
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(date: .constant(Date()))
            .environmentObject(ViewModel())
    }
}
