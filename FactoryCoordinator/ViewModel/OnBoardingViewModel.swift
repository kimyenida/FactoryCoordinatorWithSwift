//
//  OnBoardingViewModel.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import Foundation
import Combine

class OnBoardingViewModel: ViewModel {
    typealias Coo = OnBoardingCoordinator

    var coordinator: OnBoardingCoordinator?
    var triggerPublisher = PassthroughSubject<Destination, Never>()
    var cancellables = Set<AnyCancellable>()

    init(coordinator: OnBoardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func bind() {
        triggerPublisher.sink { [weak self] destination in
            switch destination {
            case .main:
                self?.coordinator?.showOnBoardingViewController()
            default: break
            }
        }
        .store(in: &cancellables)
    }
}
