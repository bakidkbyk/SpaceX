//
//  AppRouter.swift
//  SpaceX
//
//  Created by Baki on 13.01.2025.
//

import UIKit

protocol AppRouterRoutes: HomeRoute {
    func startApp()
    
}

final class AppRouter: Router, AppRouterRoutes  {

    static let shared = AppRouter()
    
    func startApp() {
        placeOnWindowHome()
    }
}
