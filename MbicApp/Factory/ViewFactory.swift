//
//  ViewFactory.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/8/24.
//

import UIKit
import Foundation

class ViewFactory: ViewFactoryProtocol {
    var currentDestination: Destination
    
    init(destination: Destination) {
        self.currentDestination = destination
    }
    
    func makeViewController(coordinator: Coordinator) -> UIViewController {
        switch self.currentDestination {
        case .splash:
            let vm = SplashViewModel(coordinator: coordinator as? SplashCoordinator)
            return SplashViewController(viewModel: vm)
        case .onBoarding:
            let vm = OnBoardingViewModel(coordinator: coordinator as? OnBoardingCoordinator)
            return OnBoardingViewController(viewModel: vm)
        case .main:
            let vm = MainViewModel(coordinator: coordinator as? MainCoordinator)
            return MainViewController(viewModel: vm)
        case .setting:
            let vm = SettingViewModel(coordinator: coordinator as? SettingCoordinator)
            return SettingViewController(viewModel: vm)
        }
    }
}
