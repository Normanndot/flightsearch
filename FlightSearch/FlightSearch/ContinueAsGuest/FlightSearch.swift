//
//  StationListViewModel.swift
//  FlightSearch
//
//  Created by Norman D on 03/11/2023.
//

import Foundation
import ServiceHandler


@Observable
class FlightSearch {
    var allStations: [String: Station] = [:]
    var origin: Station? = nil
    var destination: Station? = nil
    var fromDate: Date = Date()
    var passengersList: (adult: Int, teen: Int, childrens: Int, infants: Int) = (1, 0, 0, 0)
    let service: FlightSearching

    init(service: FlightSearchingService = FlightSearchingService(service: NetworkService())) {
        self.service = service
    }
    
    func start() {
        Task {
            let stations = try await service.fetchStations()
            
            for station in stations.stations {
                allStations[station.code] = station
            }
        }
    }
    
    func searchFlight() async throws -> Stations {
        return try await service.searchFlight(details: self)
    }
}
