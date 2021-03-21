//
//  SectionData.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/06.
//

import Foundation
import RxDataSources

struct SectionData: AnimatableSectionModelType {
    let id: String
    var items: [Item]
    
    var identity: String {
        return id
    }
    
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
    typealias Item = CellInfo
    
    init(original: SectionData, items: [Item]) {
        self = original
        self.items = items
    }
}

enum CellData {
    case none
    case coin(item: CoinResponse)
}

struct CellInfo: Equatable, IdentifiableType {
    let id: String
    let cellInfo: CellData
    
    var identity: String {
        return id
    }
    
    public static func == (lhs: CellInfo, rhs: CellInfo) -> Bool {
        return lhs.identity == rhs.identity
    }
    
}
