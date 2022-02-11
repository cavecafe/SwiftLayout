//
//  Layout.swift
//  
//
//  Created by oozoofrog on 2022/01/26.
//

import Foundation
import UIKit

public protocol Layout: CustomDebugStringConvertible {
    func prepareSuperview(_ superview: UIView?)
    func attachSuperview()
   
    func prepareConstraints()
    func activeConstraints()
}

extension Layout {
    
    public func active() -> Deactivable {
        return Deactivation(self)
    }
    
    func prepare() {
        prepareSuperview(nil)
        prepareConstraints()
    }
    
    func flattening() -> LayoutFlattening? {
        prepare()
        return self as? LayoutFlattening
    }
    
}

extension Array: Layout where Self.Element == Layout {}
