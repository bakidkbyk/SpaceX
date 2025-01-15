//
//  UpcomingViewModel.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

import Foundation

protocol UpcomingViewDataSource {}

protocol UpcomingViewEventSource {}

protocol UpcomingViewProtocol: UpcomingViewDataSource, UpcomingViewEventSource {}

final class UpcomingViewModel: BaseViewModel<UpcomingRouter>, UpcomingViewProtocol {
    
}
