//
//  Requests.swift
//  FlightSearch
//
//  Created by Norman D on 01/11/2023.
//

import Foundation
import ServiceHandler

struct Requests {
    struct AirportStation {
        static func lists() -> Request<Stations> {
            .init(
                url: .init(
                    baseURL: BaseURL.stationList,
                    path: "/stations.json"
                )!,
                httpMethod: .get
            )
        }
    }
    
    struct FlightSearchAPI {
        static func searchFlight(details: FlightSearch) -> Request<Stations> {
            .init(
                url: .init(baseURL: BaseURL.flightSearch, details: details)!,
                httpMethod: .get
            )
        }
    }
}
