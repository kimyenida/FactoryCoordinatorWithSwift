//
//  SettingCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class SettingCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    private var factory: SettingFactory
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, factory: SettingFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        showSettingController()
    }
    
    func showSettingController() {
        let settingController = factory.makeViewController(coordinator: self)
        self.navigationController.pushViewController(settingController, animated: false)
    }
    
    func showSettingModal() {
        let settingController = factory.makeViewController(coordinator: self)
        self.navigationController.topViewController?.present(settingController, animated: false)
    }
}
