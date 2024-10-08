//
//  CoordinatorFactory.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/7/24.
//

import UIKit

class CoordinatorFactory: CoordinatorFactoryProtocol {
    func createViewFactory(type: Destination) -> ViewFactoryProtocol {
        switch type {
        case .splash:
            return ViewFactory(destination: .splash)
        case .onBoarding:
            return ViewFactory(destination: .onBoarding)
        case .main:
            return ViewFactory(destination: .main)
        case .setting:
            return ViewFactory(destination: .setting)
        }
    }
    
    func createCoordinator(type: Destination, navigationController: UINavigationController) -> Coordinator {
        let factory = createViewFactory(type: type)
        switch type {
        case .splash:
            return SplashCoordinator(coordinatorFactory: self, navigationController: navigationController)
        case .onBoarding:
            return OnBoardingCoordinator(coordinatorFactory: self, navigationController: navigationController)
        case .main:
            return MainCoordinator(coordinatorFactory: self, navigationController: navigationController)
        case .setting:
            return SettingCoordinator(coordinatorFactory: self, navigationController: navigationController)
        }
    }
}
