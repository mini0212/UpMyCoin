//
//  CoinResponse.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/10.
//

import UIKit
import RxDataSources

/*
 "market": "KRW-BTC",
 "korean_name": "비트코인",
 "english_name": "Bitcoin"
 */

struct CoinResponse: Decodable, CoinItem {
    let market: String
    let koreanName: String
    let englishName: String
}

extension CoinResponse: Equatable {
    static func == (lhs: CoinResponse, rhs: CoinResponse) -> Bool {
        return lhs.market == rhs.market
            && lhs.koreanName == rhs.koreanName
            && lhs.englishName == rhs.englishName
    }
}

extension CoinResponse: IdentifiableType {
    typealias Identity = String
    
    var identity: String {
        return self.koreanName
    }
}

// IdentifiableType -> RxDataSources를 import 해야 사용가능
// AnimatableSectionModel를 사용하려면 Equatable, IdentifiableType를 채택해야함
