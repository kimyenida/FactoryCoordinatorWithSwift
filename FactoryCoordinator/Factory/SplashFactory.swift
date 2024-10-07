//
//  SplashFactory.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class SplashFactory: Factory {
    typealias Coo = SplashCoordinator
    typealias VM = SplashViewModel
    typealias VC = SplashViewController
    
    func makeViewModel(coordinator: SplashCoordinator) -> SplashViewModel {
        return SplashViewModel(coordinator: coordinator)
    }
    
    func makeViewController(coordinator: SplashCoordinator) -> SplashViewController {
        let viewModel = self.makeViewModel(coordinator: coordinator)
        return SplashViewController(viewModel: viewModel)
    }
}
