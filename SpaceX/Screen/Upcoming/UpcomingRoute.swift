//
//  UpcomingRoute.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

protocol UpcomingRoute {
    func presentUpcoming()
}

extension UpcomingRoute where Self: RouterProtocol {
    
    func presentUpcoming() {
        let router = UpcomingRouter()
        let viewModel = UpcomingViewModel(router: router)
        let viewController = UpcomingViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
