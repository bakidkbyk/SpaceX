//
//  PastViewModel.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

import Foundation

protocol PastViewDataSource {}

protocol PastViewEventSource {}

protocol PastViewProtocol: PastViewDataSource, PastViewEventSource {}

final class PastViewModel: BaseViewModel<PastRouter>, PastViewProtocol {
    
}
