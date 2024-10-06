//
//  OnBoardingFactory.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit
import Foundation

class OnBoardingFactory {
    func makeOnBoardingViewModel(coordinator: OnBoardingCoordinator) -> OnBoardingViewModel {
        return OnBoardingViewModel(coordinator: coordinator)
    }
    
    func makeOnBoardingViewController(coordinator: OnBoardingCoordinator) -> OnBoardingViewController {
        let viewModel = makeOnBoardingViewModel(coordinator: coordinator)
        return OnBoardingViewController(viewModel: viewModel)
    }
}
