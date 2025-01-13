//
//  Animator.swift
//  SpaceX
//
//  Created by Baki on 13.01.2025.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
