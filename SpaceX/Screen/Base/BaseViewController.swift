//
//  BaseViewController.swift
//  SpaceX
//
//  Created by Baki on 13.01.2025.
//

import UIKit

class BaseViewController<V: BaseViewModeProtocol>: UIViewController {
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
