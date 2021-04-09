//
//  CoinResponse.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/10.
//

import UIKit

/*
 "market: "KRW-BTC",
 "korean_name: "비트코인",
 "english_name: "Bitcoin"
 */

class CoinResponse: Decodable {
    let market: String
    
    enum CodingKeys: String, CodingKey {
        case market
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        market = try values.decode(String.self, forKey: .market)
    }
}

extension CoinResponse: Equatable {
    static func == (lhs: CoinResponse, rhs: CoinResponse) -> Bool {
        return lhs.market == rhs.market
    }
}

// IdentifiableType -> RxDataSources를 import 해야 사용가능
// AnimatableSectionModel를 사용하려면 Equatable, IdentifiableType를 채택해야함
