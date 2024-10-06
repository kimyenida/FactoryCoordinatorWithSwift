//
//  SettingFactory.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class SettingFactory {
    func makeSettingViewModel(coordinator: SettingCoordinator) -> SettingViewModel {
        return SettingViewModel(coordinator: coordinator)
    }
    
    func makeSettingViewController(coordinator: SettingCoordinator) -> SettingViewController {
        let viewModel = self.makeSettingViewModel(coordinator: coordinator)
        return SettingViewController(viewModel: viewModel)
    }
}
