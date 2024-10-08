//
//  Coordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var coordinatorFactory: CoordinatorFactory? { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

extension Coordinator {
    func childDidFinish(_ coordinator: Coordinator) {
        for (index, child) in children.enumerated() {
            if child === coordinator {
                children.remove(at: index)
                break
            }
        }
    }
}
