//
//  SplashViewModel.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import Combine
import Foundation

class SplashViewModel {
    private let coordinator: SplashCoordinator
    private var cancellables = Set<AnyCancellable>()
    
    var triggerPublisher = PassthroughSubject<Destination, Never>()
    
    init(coordinator: SplashCoordinator) {
        self.coordinator = coordinator
    }
    
    func start() {
        triggerPublisher.sink { [weak self] destination in
            switch destination {
            case .main:
                self?.coordinator.showCheckUpdatePopup()
            case .onBoarding:
                self?.coordinator.startOnBoardingCoordinator()
            default: break
            }
        }
        .store(in: &cancellables)
    }
    
    func checkInitialSetUp() {
        CheckAppStatus.shared.checkFirstInstall().sink { [weak self] destination in
            self?.triggerPublisher.send(destination)
        }
        .store(in: &cancellables)
    }
}
