//
//  CoordinatorFactoryProtocol.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/7/24.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func createCoordinator(type: Destination, navigationController: UINavigationController) -> Coordinator
    func createViewFactory(type: Destination) -> ViewFactoryProtocol
}
