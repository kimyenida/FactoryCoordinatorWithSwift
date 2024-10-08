//
//  ViewModel.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/7/24.
//

import Combine

protocol ViewModel {
    associatedtype CoordinatorTypes: Coordinator
    var coordinator: CoordinatorTypes? { get set }
    var triggerPublisher: PassthroughSubject<Destination, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    func bind()
}
