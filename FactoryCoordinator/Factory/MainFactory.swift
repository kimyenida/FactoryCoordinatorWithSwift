//
//  MainFactory.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit
import Foundation

class MainFactory: Factory {
    typealias Coo = MainCoordinator
    typealias VM = MainViewModel
    typealias VC = MainViewController

    func makeViewModel(coordinator: MainCoordinator) -> MainViewModel {
        return MainViewModel(coordinator: coordinator)
    }
    
    func makeViewController(coordinator: MainCoordinator) -> MainViewController {
        let viewModel = self.makeViewModel(coordinator: coordinator)
        return MainViewController(viewModel: viewModel)
    }
}
