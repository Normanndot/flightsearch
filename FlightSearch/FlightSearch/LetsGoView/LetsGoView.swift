//
//  LetsGoView.swift
//  FlightSearch
//
//  Created by Norman D on 04/11/2023.
//

import SwiftUI
import ServiceHandler

struct LetsGoView: View {
    @Environment(FlightSearch.self) private var flight

    var body: some View {
        Button {
            Task {
                try await flight.searchFlight()
            }
        } label: {
            Text("Let's go")
                .customBoarderStyle()
        }
    }
}
