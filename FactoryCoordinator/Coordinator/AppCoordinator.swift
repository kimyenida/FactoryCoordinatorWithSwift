//
//  AppCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class AppCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        startSplashCoordinator()
    }
    
    func startSplashCoordinator() {
        let splashCoordinator = SplashCoordinator(navigationController: navigationController, factory: SplashFactory())
        children.removeAll()
        splashCoordinator.parentCoordinator = self
        children.append(splashCoordinator)
        splashCoordinator.start()
    }
}
