//
//  CoinName.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/23.
//

import Foundation

class CoinName: CoinResponse {
    let koreanName: String
    let englishName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName, englishName
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        koreanName = try values.decode(String.self, forKey: .koreanName)
        englishName = try values.decode(String.self, forKey: .englishName)
        try super.init(from: decoder)
    }
}
