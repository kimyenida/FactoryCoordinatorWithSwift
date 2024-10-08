//
//  MainViewModel.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import Foundation
import Combine

class MainViewModel: ViewModel {
    var coordinator: MainCoordinator?
    var triggerPublisher = PassthroughSubject<Destination, Never>()
    var cancellables = Set<AnyCancellable>()

    init(coordinator: MainCoordinator?) {
        self.coordinator = coordinator
    }
    
    func bind() {
        triggerPublisher.sink { [weak self] destination in
            switch destination {
            case .setting:
                self?.coordinator?.startSettingCoordinator()
            default: break
            }
        }
    }
}
