//
//  SettingFactory.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class SettingFactory: Factory {
    typealias Coo = SettingCoordinator
    typealias VM = SettingViewModel
    typealias VC = SettingViewController

    func makeViewModel(coordinator: SettingCoordinator) -> SettingViewModel {
        return SettingViewModel(coordinator: coordinator)
    }
    
    func makeViewController(coordinator: SettingCoordinator) -> SettingViewController {
        let viewModel = self.makeViewModel(coordinator: coordinator)
        return SettingViewController(viewModel: viewModel)
    }
}
