//
//  AppCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var children: [Coordinator] = []
    var coordinatorFactory: CoordinatorFactory?
    weak var parentCoordinator: Coordinator?
    
    init() {
        self.navigationController = UINavigationController()
        self.coordinatorFactory = CoordinatorFactory()
    }
    
    func start() {
        guard let coordinatorFactory = self.coordinatorFactory else { return }
        let splashCoordinator = coordinatorFactory.createCoordinator(type: .splash, navigationController: navigationController)
        children.removeAll()
        splashCoordinator.parentCoordinator = self
        children.append(splashCoordinator)
        splashCoordinator.start()    }
    
    func getRoot() -> UINavigationController {
        return self.navigationController
    }
    
    func destroy() {
        self.children.removeAll()
        self.navigationController.viewControllers.removeAll()
    }
}
