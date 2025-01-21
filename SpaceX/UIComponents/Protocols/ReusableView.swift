//
//  ReusableView.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

import UIKit

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
