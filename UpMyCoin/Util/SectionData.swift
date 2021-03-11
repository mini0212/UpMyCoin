//
//  SectionData.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/06.
//

import Foundation
import RxDataSources

protocol CoinItem {
    
}

struct SectionData {
    let id: String
    var items: [Item]
    
    init(id: String, items: [Item]) {
        self.id = id
        self.items = items
    }
}

extension SectionData: Equatable {
    static func == (lhs: SectionData, rhs: SectionData) -> Bool {
        return lhs.id == rhs.id
    }
}

extension SectionData: SectionModelType {
    typealias Item = CoinResponse
    
    init(original: SectionData, items: [Item]) {
        self = original
        self.items = items
    }
    
}

enum SectionModel {
    case string(items: String)
}
