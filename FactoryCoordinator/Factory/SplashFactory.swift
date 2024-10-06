//
//  SplashFactory.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class SplashFactory {
    func makeSplashViewModel(coordinator: SplashCoordinator) -> SplashViewModel {
        return SplashViewModel(coordinator: coordinator)
    }
    
    func makeSplashViewController(coordinator: SplashCoordinator) -> SplashViewController {
        let viewModel = self.makeSplashViewModel(coordinator: coordinator)
        return SplashViewController(viewModel: viewModel)
    }
}
