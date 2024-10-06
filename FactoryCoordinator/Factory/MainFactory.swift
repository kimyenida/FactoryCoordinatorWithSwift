//
//  MainFactory.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit
import Foundation

class MainFactory {
    func makeMainViewModel(coordinator: MainCoordinator) -> MainViewModel {
        return MainViewModel(coordinator: coordinator)
    }
    
    func makeMainViewController(coordinator: MainCoordinator) -> MainViewController {
        let viewModel = self.makeMainViewModel(coordinator: coordinator)
        return MainViewController(viewModel: viewModel)
    }
}
