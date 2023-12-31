//
//  String+Extension.swift
//  FlightSearch
//
//  Created by Norman D on 05/11/2023.
//

import Foundation

extension String {
    //MARK:- Convert UTC To Local Date by passing date formats value
    var toUTCToLocal: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "hh:mm"

        return dateFormatter.string(from: dt ?? Date())
      }
    
    var toMMMddYYYY: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        dateFormatter.timeZone = .gmt

        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "MMM, dd yyyy"

        return dateFormatter.string(from: dt ?? Date())
      }
}
