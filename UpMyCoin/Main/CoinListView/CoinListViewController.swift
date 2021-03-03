//
//  CoinListViewController.swift
//  UpMyCoin
//
//  Created by Min on 2021/02/23.
//

import UIKit

class CoinListViewController: UIViewController {
    
    static func instance() -> CoinListViewController {
        let vc = CoinListViewController(nibName: CoinListViewController.className, bundle: nil)
        return vc
    }

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CoinListViewModel = CoinListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCoinList()
    }
    
}

