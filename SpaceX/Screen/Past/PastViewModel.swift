//
//  PastViewModel.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

import Foundation

protocol PastViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemAt(_ indexPath: IndexPath) -> PastCellProtocol
}

protocol PastViewEventSource {}

protocol PastViewProtocol: PastViewDataSource, PastViewEventSource {}

final class PastViewModel: BaseViewModel<PastRouter>, PastViewProtocol {
    
    var pastCellItems: [PastCellProtocol] = []
    var getDataDidSuccess: VoidClosure?
    
    func numberOfItemsAt() -> Int {
       return pastCellItems.count
    }
    
    func cellItemAt(_ indexPath: IndexPath) -> any PastCellProtocol {
        return pastCellItems[indexPath.row]
    }
    
    func fetchUpcomingData() {
        pastRequest()
    }
    
}

// M?ARK: - Network
extension PastViewModel {
    
    private func pastRequest() {
        showLoading?()
        let request = PastRequest()
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                let cellItems = response.map { PastCellModel(past: $0) }
                self.pastCellItems = cellItems
                self.getDataDidSuccess?()
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
}
