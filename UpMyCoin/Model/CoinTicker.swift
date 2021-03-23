//
//  CoinTicker.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/24.
//

import Foundation

class CoinTicker: CoinResponse {
    let tradeDate: Int?
    let tradeTime: Int?
    let tradeDateKst: Int?
    let tradeTimeKst: Int?
//    let tradeTimestamp: Double
//    let openingPrice: Double
//    let highPrice: Double
//    let lowPrice: Double
//    let tradePrice: Double
//    let prevClosingprice: Double
//    let change: String
//    let changePrice: Double
//    let changeRate: Double
//    let signedChangePrice: Double
//    let signedXhangeRate: Double
//    let tradeVolume: Double
//    let highest52WeekPrice: Double
//    let highest52WeekDate: String
//    let lowest52WeekPrice: Double
//    let lowest52WeekDate: String
//    let timestamp: Double
    
    enum CodingKeys: String, CodingKey {
        case tradeDate = "trade_date"
        case tradeTime = "trade_time"
        case tradeDateKst = "trade_date_kst"
        case tradeTimeKst = "trade_time_kst"
//        case tradeTimestamp = "trade_timestamp"
//        case openingPrice, highPrice, lowPrice, tradePrice, prevClosingprice
//        case change, changePrice
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tradeDate = try values.decodeIfPresent(Int.self, forKey: .tradeDate)
        tradeTime = try values.decodeIfPresent(Int.self, forKey: .tradeTime)
        tradeDateKst = try values.decodeIfPresent(Int.self, forKey: .tradeDateKst)
        tradeTimeKst = try values.decodeIfPresent(Int.self, forKey: .tradeTimeKst)
//        tradeTimestamp = try values.decode(Double.self, forKey: .tradeTimestamp)
        try super.init(from: decoder)
    }
}

/*
 "market": "KRW-BTC",
 "trade_date": "20180418",
 "trade_time": "102340",
 "trade_date_kst": "20180418",
 "trade_time_kst": "192340",
 "trade_timestamp": 1524047020000,
 "opening_price": 8450000,
 "high_price": 8679000,
 "low_price": 8445000,
 "trade_price": 8621000,
 "prev_closing_price": 8450000,
 "change": "RISE",
 "change_price": 171000,
 "change_rate": 0.0202366864,
 "signed_change_price": 171000,
 "signed_change_rate": 0.0202366864,
 "trade_volume": 0.02467802,
 "acc_trade_price": 108024804862.58254,
 "acc_trade_price_24h": 232702901371.09309,
 "acc_trade_volume": 12603.53386105,
 "acc_trade_volume_24h": 27181.31137002,
 "highest_52_week_price": 28885000,
 "highest_52_week_date": "2018-01-06",
 "lowest_52_week_price": 4175000,
 "lowest_52_week_date": "2017-09-25",
 "timestamp": 1524047026072
 */
