//
//  PastRoute.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

protocol PastRoute {
    func presentPast()
}

extension PastRoute where Self: RouterProtocol {
    
    func presentPast() {
        let router = PastRouter()
        let viewModel = PastViewModel(router: router)
        let viewController = PastViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
