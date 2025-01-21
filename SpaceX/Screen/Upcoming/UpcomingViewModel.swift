//
//  UpcomingViewModel.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

import Foundation

protocol UpcomingViewDataSource {
   func numberOfItemsAt() -> Int
   func cellItemAt(_ indexPath: IndexPath) -> UpcomingCellProtocol
}

protocol UpcomingViewEventSource {}

protocol UpcomingViewProtocol: UpcomingViewDataSource, UpcomingViewEventSource {}

final class UpcomingViewModel: BaseViewModel<UpcomingRouter>, UpcomingViewProtocol {
   
   var upcomingCellItems: [UpcomingCellProtocol] = []
   var getDataDidSuccess: VoidClosure?
   
   func numberOfItemsAt() -> Int {
      return upcomingCellItems.count
   }
   
   func cellItemAt(_ indexPath: IndexPath) -> any UpcomingCellProtocol {
       return upcomingCellItems[indexPath.row]
   }
   
   func fetchUpcomingData() {
       upcomingRequest()
   }
    
    func setDefaults() {
        upcomingCellItems.removeAll()
    }
}

// MARK: - Network
extension UpcomingViewModel {
   
   private func upcomingRequest() {
       showLoading?()
       let request = UpcomingRequest()
       dataProvider.request(for: request) { [weak self] result in
           guard let self = self else { return }
           self.hideLoading?()
           switch result {
           case .success(let response):
               let cellItems = response.map { UpcomingCellModel(upcoming: $0) }
               self.upcomingCellItems = cellItems
               self.getDataDidSuccess?()
           case .failure(let error):
               print("Error:", error.localizedDescription)
           }
       }
   }
}
