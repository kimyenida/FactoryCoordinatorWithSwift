//
//  OnBoardingFactory.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit
import Foundation

class OnBoardingFactory: Factory {
    typealias Coo = OnBoardingCoordinator
    typealias VM = OnBoardingViewModel
    typealias VC = OnBoardingViewController

    func makeViewModel(coordinator: OnBoardingCoordinator) -> OnBoardingViewModel {
        return OnBoardingViewModel(coordinator: coordinator)
    }
    
    func makeViewController(coordinator: OnBoardingCoordinator) -> OnBoardingViewController {
        let viewModel = makeViewModel(coordinator: coordinator)
        return OnBoardingViewController(viewModel: viewModel)
    }
}
