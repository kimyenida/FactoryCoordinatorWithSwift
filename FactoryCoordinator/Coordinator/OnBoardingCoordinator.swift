//
//  OnBoardingCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//


import UIKit

class OnBoardingCoordinator: Coordinator {
    weak var parendCoordinator: Coordinator?
    private let factory: OnBoardingFactory
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, factory: OnBoardingFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func showOnBoardingViewController() {
        let onBoardingViewController = factory.makeOnBoardingViewController(coordinator: self)
        self.navigationController.pushViewController(onBoardingViewController, animated: false)
    }
    
    func showOnBoardingToMain() {
        let splashCoordinator = parendCoordinator as? SplashCoordinator
        splashCoordinator?.showCheckUpdatePopup()
    }
}
