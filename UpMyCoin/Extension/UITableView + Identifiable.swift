//
//  UITableView + Identifiable.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/09.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cell: T.Type) where T: NibIdentifiable & ClassIdentifiable {
        register(cell.nib, forCellReuseIdentifier: cell.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.identifier) as? T else {
            fatalError("Couldn't dequeue \(T.self) with identifier \(type.identifier)")
        }
        return cell
    }

    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self, forIndexPath indexPath: IndexPath) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T else {
            fatalError("Couldn't dequeue \(T.self) with identifier \(type.identifier)")
        }
        return cell
    }
}

