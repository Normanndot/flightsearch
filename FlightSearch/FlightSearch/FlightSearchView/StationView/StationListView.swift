//
//  StationListView.swift
//  FlightSearch
//
//  Created by Norman D on 04/11/2023.
//

import SwiftUI

struct StationListView: View {
    @Bindable var flight: FlightSearch
    @Binding var isPresented: Bool
    let stationType: StationType

    var body: some View {
        if stationLists.isEmpty {
            ContentUnAvailableCustomView(isPresented: $isPresented)
        } else {
            List(stationLists.keys.sorted(), id: \.self) { key in
                let station = stationLists[key]

                Button {
                    if stationType == .origin {
                        flight.origin = station
                        flight.destination = nil
                    } else {
                        flight.destination = station
                    }
                    isPresented.toggle()
                } label: {
                    StationRow(station: station)
                }
                .padding()
            }
            .navigationTitle("Choose Departure")
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var stationLists: [String: Station] {
        var list: [String: Station] = [:]
        
        if stationType == .origin {
            list = flight.allStations
        } else {
            if let markets = flight.origin?.markets {
                for aMarket in markets {
                    let station = flight.allStations[aMarket.code]
                    list[aMarket.code] = station
                }
            }
        }
        
        return list
    }
}
