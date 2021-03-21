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

struct CoinResponse: Decodable {
    let market: String
    let koreanName: String
    let englishName: String
}

// IdentifiableType -> RxDataSources를 import 해야 사용가능
// AnimatableSectionModel를 사용하려면 Equatable, IdentifiableType를 채택해야함
