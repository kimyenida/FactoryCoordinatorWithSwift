//
//  SettingCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class SettingCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var coordinatorFactory: CoordinatorFactory?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(coordinatorFactory: CoordinatorFactory? = nil, navigationController: UINavigationController) {
        self.coordinatorFactory = coordinatorFactory
        self.navigationController = navigationController
    }
    
    func start() {
        showSettingController()
    }
    
    func showSettingController() {
        guard let factory = coordinatorFactory?.createViewFactory(type: .setting) else { return }
        let settingController = factory.makeViewController(coordinator: self)
        self.navigationController.pushViewController(settingController, animated: false)
    }
    
//    func showSettingModal() {
//        guard let factory = coordinatorFactory?.createViewFactory(type: .setting) else { return }
//        let settingController = factory.makeViewController(coordinator: self)
//        self.navigationController.topViewController?.present(settingController, animated: false)
//    }
}
