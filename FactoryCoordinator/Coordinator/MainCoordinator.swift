//
//  MainCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class MainCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    private let factory: MainFactory

    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, factory: MainFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        showMainViewController()
    }
    
    func showMainViewController() {
        let mainViewController = factory.makeViewController(coordinator: self)
        self.navigationController.viewControllers.removeAll()
        self.navigationController.pushViewController(mainViewController, animated: false)
    }
    
    func startSettingCoordinator() {
        let settingCoordinator = SettingCoordinator(navigationController: navigationController, factory: SettingFactory())
        settingCoordinator.parentCoordinator = self
        children.append(settingCoordinator)
        settingCoordinator.start()
    }
}
