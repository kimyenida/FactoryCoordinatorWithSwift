//
//  MainCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class MainCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var coordinatorFactory: CoordinatorFactory?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(coordinatorFactory: CoordinatorFactory? = nil, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.coordinatorFactory = coordinatorFactory
    }
    
    func start() {
        showMainViewController()
    }
    
    func showMainViewController() {
        guard let factory = coordinatorFactory?.createViewFactory(type: .main) else { return }
        let mainViewController = factory.makeViewController(coordinator: self)
        self.navigationController.viewControllers.removeAll()
        self.navigationController.pushViewController(mainViewController, animated: false)
    }
    
    func startSettingCoordinator() {
        guard let settingCoordinator = coordinatorFactory?.createCoordinator(type: .setting, navigationController: navigationController) else { return }
        settingCoordinator.parentCoordinator = self
        children.append(settingCoordinator)
        settingCoordinator.start()
    }
}
