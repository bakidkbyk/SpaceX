//
//  UIActivityIndicatorView.swift
//  SpaceX
//
//  Created by Baki on 16.01.2025.
//

import UIKit

public class ActivityIndicatorView: UIActivityIndicatorView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        style = .gray
        tintColor = .gray
        hidesWhenStopped = true
    }
    
}
