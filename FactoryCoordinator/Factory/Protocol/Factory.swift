//
//  Factory.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/7/24.
//

import UIKit

protocol Factory {
    associatedtype Coo: Coordinator
    associatedtype VM: ViewModel
    associatedtype VC: UIViewController

    func makeViewModel(coordinator: Coo) -> VM
    func makeViewController(coordinator: Coo) -> VC
}
