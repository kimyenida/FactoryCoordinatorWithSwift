//
//  OnBoardingCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//


import UIKit

class OnBoardingCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var coordinatorFactory: CoordinatorFactory?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(coordinatorFactory: CoordinatorFactory?, navigationController: UINavigationController) {
        self.coordinatorFactory = coordinatorFactory
        self.navigationController = navigationController
    }
    
    func start() {
        showOnBoardingViewController()
    }
    
    func showOnBoardingViewController() {
        guard let factory = coordinatorFactory?.createViewFactory(type: .onBoarding) else { return }
        let onBoardingViewController = factory.makeViewController(coordinator: self)
        self.navigationController.pushViewController(onBoardingViewController, animated: false)
    }
    
    func proceedToMain() {
        (parentCoordinator as? SplashCoordinator)?.showCheckUpdatePopup()
    }
}
