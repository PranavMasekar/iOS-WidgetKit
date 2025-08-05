//
//  CountryListCell.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 04/08/25.
//

import SwiftUI

struct CountryListCell: View {
    var country: Country
    
    var body: some View {
        HStack {
            
            Text(country.flag)
                .font(.title)
                .shadow(radius: 2)
                .padding(.horizontal, 5)
                .background(.indigo.gradient.opacity(0.2), in: RoundedRectangle(cornerRadius: 5))
            
            Text(country.name)
            
            Spacer()
            
            Text(country.currencyCode)
            
        } //: HStack
        .padding()
        .contentShape(Rectangle())
    }
}

#Preview {
    CountryListCell(country: .USA)
}
