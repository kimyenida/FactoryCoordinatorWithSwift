//
//  MainViewModel.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import Foundation
import Combine

class MainViewModel {
    let coordinator: MainCoordinator?
    var triggerPublisher = PassthroughSubject<Destination, Never>()
    private var cancellables = Set<AnyCancellable>()

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func start() {
        triggerPublisher.sink { [weak self] destination in
            switch destination {
            case .setting:
                self?.coordinator?.startSettingCoordinator()
            default: break
            }
        }
    }
}
