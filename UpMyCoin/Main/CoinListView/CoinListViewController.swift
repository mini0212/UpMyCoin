//
//  CoinListViewController.swift
//  UpMyCoin
//
//  Created by Min on 2021/02/23.
//

import UIKit
import RxSwift
import RxDataSources

typealias CoinSectionModel = AnimatableSectionModel<String, CoinResponse>

class CoinListViewController: DisposableViewController {
    
    static func instance() -> CoinListViewController {
        let vc = CoinListViewController(nibName: CoinListViewController.identifier, bundle: Bundle(for: self))
        return vc
    }

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CoinListViewModel = CoinListViewModel()
    
    var dataSoure: RxTableViewSectionedAnimatedDataSource<CoinSectionModel>!
    
    var configureCell: RxTableViewSectionedAnimatedDataSource<CoinSectionModel>.ConfigureCell {
        return { _, tableView, indexPath, item in
            let cell: CoinListCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setData(with: item)
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        bindDataSoure()
        viewModel.requestCoinList()
    }
    
    private func setTableView() {
        tableView.register(cell: CoinListCell.self)
        dataSoure = RxTableViewSectionedAnimatedDataSource<CoinSectionModel>(configureCell: configureCell)
        
    }
    
    private func bindDataSoure() {
        viewModel.dataSource
            .bind(to: tableView.rx.items(dataSource: dataSoure))
            .disposed(by: disposeBag)
    }
}

