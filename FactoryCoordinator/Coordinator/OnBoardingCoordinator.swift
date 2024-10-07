//
//  OnBoardingCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//


import UIKit

class OnBoardingCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    private let factory: OnBoardingFactory
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, factory: OnBoardingFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        showOnBoardingViewController()
    }
    
    func showOnBoardingViewController() {
        let onBoardingViewController = factory.makeViewController(coordinator: self)
        self.navigationController.pushViewController(onBoardingViewController, animated: false)
    }
    
    func proceedToMain() {
        (parentCoordinator as? SplashCoordinator)?.showCheckUpdatePopup()
    }
}
