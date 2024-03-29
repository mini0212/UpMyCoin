//
//  CoinListViewModel.swift
//  UpMyCoin
//
//  Created by Min on 2021/02/23.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

struct CoinListViewModel {
    private let coinItem = BehaviorRelay<[CoinName]>(value: [])
    private let tickerItem = BehaviorRelay<[CoinTicker]>(value: [])
    private let serverUtil = ServerUtil.shared
    private var disposeBag = DisposeBag()
    
    var dataSource: Observable<[SectionData]> {
        return coinItem
            .map { item -> [SectionData] in

                let markets = item.map { $0.market }.joined(separator: ",")
                requestTickerInfo(with: markets)


                let sectionItem = item
                    .enumerated()
                    .map {

                        CellInfo(id: "\($1.market)/", cellInfo: .coin(item: $1))
                    }
                return [SectionData(id: "id", items: sectionItem)]
            }
            .asObservable()
    }

    func requestCoinList() {
        var httpRequest = HttpRequest()
        httpRequest.url = "market/all?isDetails=false"
        
        serverUtil.rx.requestRx(with: httpRequest)
            .do(onNext: { (item: [CoinName]) in
                let markets = item.map { $0.market }.joined(separator: ",")
                requestTickerInfo(with: markets)
            })
            .bind(to: coinItem)
            .disposed(by: disposeBag)
    }
    
    func requestTickerInfo(with markets: String) {
        guard !markets.isEmpty else { return }
        var httpRequest = HttpRequest()
        httpRequest.url = "ticker"
        httpRequest.parameters = ["markets" : markets]
        httpRequest.encoding = .urlQuery
        
        serverUtil.rx.requestRx(with: httpRequest)
            .bind(to: tickerItem)
            .disposed(by: disposeBag)
    }
    
}
