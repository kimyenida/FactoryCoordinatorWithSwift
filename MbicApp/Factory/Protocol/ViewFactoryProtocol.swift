//
//  Factory.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/7/24.
//

import UIKit

protocol ViewFactoryProtocol {
    func makeViewController(coordinator: Coordinator) -> UIViewController
}
