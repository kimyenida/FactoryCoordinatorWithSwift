//
//  SettingViewModel.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import Foundation
import Combine

class SettingViewModel: ViewModel {    
    var coordinator: SettingCoordinator?
    var triggerPublisher = PassthroughSubject<Destination, Never>()
    var cancellables = Set<AnyCancellable>()

    init(coordinator: SettingCoordinator?) {
        self.coordinator = coordinator
    }
    
    func bind() {
        
    }
}
