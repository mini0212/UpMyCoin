//
//  NibIdentifiable.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/10.
//

import UIKit

protocol NibIdentifiable: AnyObject {
    static var nib: UINib { get }
}

extension NibIdentifiable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}
