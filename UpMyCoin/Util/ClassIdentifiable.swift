//
//  ClassIdentifiable.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/10.
//

import UIKit

protocol ClassIdentifiable: AnyObject {
    static var identifier: String { get }
}

extension ClassIdentifiable {
    static var identifier: String {
        return String(describing: self)
    }
}
