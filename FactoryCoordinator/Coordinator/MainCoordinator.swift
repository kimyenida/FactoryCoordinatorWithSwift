//
//  MainCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class MainCoordinator: Coordinator {
    weak var parendCoordinator: Coordinator?
    private let factory: MainFactory

    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, factory: MainFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func showMainViewController() {
        let mainViewController = factory.makeMainViewController(coordinator: self)
        self.navigationController.viewControllers.removeAll()
        self.navigationController.pushViewController(mainViewController, animated: false)
    }
    
    func startSettingCoordinator() {
        let settingCoordinator = SettingCoordinator(navigationController: navigationController, factory: SettingFactory())
        settingCoordinator.parendCoordinator = self
        children.append(settingCoordinator)
        settingCoordinator.showSettingController()
    }
}
