//
//  HomeViewModel.swift
//  SpaceX
//
//  Created by Baki on 13.01.2025.
//

import Foundation

protocol HomeViewDataSource {}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    
    var selectedSegmentIndex = 0

}
