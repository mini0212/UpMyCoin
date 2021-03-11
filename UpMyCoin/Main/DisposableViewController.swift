//
//  DisposableViewController.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/10.
//

import UIKit
import RxSwift
import RxCocoa

class DisposableViewController: UIViewController, ClassIdentifiable {
    var disposeBag = DisposeBag()
}
