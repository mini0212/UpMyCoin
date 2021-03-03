//
//  Extension + NSObject.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/03.
//

import Foundation

extension NSObject {
   class var className: String {
        return String(describing: self)
    }

   var className: String {
        return type(of: self).className
    }
}
