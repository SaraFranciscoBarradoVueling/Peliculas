//
//  MovieList.swift
//  Peliculas
//
//  Created by Sara Francisco on 28/12/21.
//

import Foundation

typealias Rates = [RateServiceResponse]

internal struct Rate {
    var from: String?
    var to: String?
    var rate: Double?
    
    init(from: String, to: String, rate: Double) {
        self.from = from
        self.to = to
        self.rate = rate
    }
}

internal struct RateServiceResponse: Decodable {
    let from: String?
    let to: String?
    let rate: String?
    
    enum CodingKeys: String, CodingKey {
        case from
        case to
        case rate
    }
}

internal final class RateBinding {
    
    static func bind(_ soaRates: [RateServiceResponse]) -> [Rate] {
        var rates: [Rate] = []
        soaRates.forEach {
            rates.append(RateBinding.bind($0))
        }
        return rates
    }
    
    static func bind(_ soaRate: RateServiceResponse) -> Rate {
        var rate = Rate(from: "", to: "", rate: 0)
        rate.from = soaRate.from
        rate.to = soaRate.to
        if let rateFloat = soaRate.rate {
            rate.rate = Double.init(rateFloat)
        }
        
        return rate
    }
}
