//
//  OnBoardingViewModel.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import Foundation
import Combine

class OnBoardingViewModel {
    let coordinator: OnBoardingCoordinator?
    var triggerPublisher = PassthroughSubject<Destination, Never>()
    private var cancellables = Set<AnyCancellable>()

    init(coordinator: OnBoardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func start() {
        triggerPublisher.sink { [weak self] destination in
            switch destination {
            case .main:
                self?.coordinator?.showOnBoardingToMain()
            default: break
            }
        }
        .store(in: &cancellables)
    }
}
