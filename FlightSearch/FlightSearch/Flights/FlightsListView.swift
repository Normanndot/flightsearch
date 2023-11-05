//
//  FlightsListView.swift
//  FlightSearch
//
//  Created by Norman D on 05/11/2023.
//

import SwiftUI

struct FlightsListView: View {
    let flights: [Flight]
    @Binding var isPresented: Bool
    
    var body: some View {
        
        VStack {
            if flights.isEmpty {
                NoFlightView(isPresented: $isPresented)
            } else {
                HStack {
                    Spacer()
                    Button {
                        isPresented.toggle()
                    } label: {
                        Text("Done")
                    }
                    .padding()
                }
                List(flights) { flight in
                    FlightRow(flight: flight)
                }
            }
        }
    }
}
