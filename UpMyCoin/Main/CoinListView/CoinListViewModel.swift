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
    private let coinItem = BehaviorRelay<[CoinResponse]>(value: [])
    private let serverUtil = ServerUtil.shared
    private var disposeBag = DisposeBag()
    
    var dataSource: Observable<[CoinSectionModel]> {
        return coinItem
            .map { [CoinSectionModel(model: "", items: $0)] }
            .asObservable()
    }
    
    func requestCoinList() {
        var httpRequest = HttpRequest()
        httpRequest.url = "market/all?isDetails=false"
        
        serverUtil.rx.requestRx(with: httpRequest)
            .bind(to: self.coinItem)
            .disposed(by: disposeBag)
    }
}
