//
//  SettingViewModel.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import Foundation
import Combine

class SettingViewModel {
    let coordinator: SettingCoordinator?
    var triggerPublisher = PassthroughSubject<Destination, Never>()
    private var cancellables = Set<AnyCancellable>()

    init(coordinator: SettingCoordinator) {
        self.coordinator = coordinator
    }
    
    func start() {
        
    }
}
