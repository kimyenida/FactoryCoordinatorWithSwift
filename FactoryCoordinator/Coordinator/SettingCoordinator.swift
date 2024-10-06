//
//  SettingCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class SettingCoordinator: Coordinator {
    weak var parendCoordinator: Coordinator?
    private var factory: SettingFactory
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, factory: SettingFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func showSettingController() {
        let settingController = factory.makeSettingViewController(coordinator: self)
        self.navigationController.pushViewController(settingController, animated: false)
    }
}
