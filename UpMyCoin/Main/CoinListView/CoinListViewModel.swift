//
//  CoinListViewModel.swift
//  UpMyCoin
//
//  Created by Min on 2021/02/23.
//

import Foundation
import RxSwift
import RxCocoa

struct CoinListViewModel {
    
    let coinItem = BehaviorRelay<[CoinResponse]>(value: [])
    private let serverUtil = ServerUtil.shared
    private var disposeBag = DisposeBag()
    init() {
        
    }
    
    
    func getCoinList() {
        var httpRequest = HttpRequest()
        httpRequest.url = "market/all?isDetails=false"
        
        serverUtil.rx.requestRx(with: httpRequest).subscribe(onNext: { (list: [CoinResponse]) in
            self.coinItem.accept(list)
        }).disposed(by: disposeBag)

    }
}


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
