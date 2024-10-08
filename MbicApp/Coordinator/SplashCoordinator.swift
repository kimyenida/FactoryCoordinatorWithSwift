//
//  SplashCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit
import Combine

class SplashCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    private var cancellables = Set<AnyCancellable>()
    var coordinatorFactory: CoordinatorFactory?
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController

    init(coordinatorFactory: CoordinatorFactory?, navigationController: UINavigationController) {
        self.coordinatorFactory = coordinatorFactory
        self.navigationController = navigationController
    }
    
    func start() {
        showSplashViewController()
    }
    
    func showSplashViewController() {
        guard let splashFactory = self.coordinatorFactory?.createViewFactory(type: .splash) else { return }
        let splashViewController = splashFactory.makeViewController(coordinator: self)
        self.navigationController.pushViewController(splashViewController, animated: false)
    }
    
    func startMainCoordinator() {
        guard let coordinatorFactory = self.coordinatorFactory else { return }
        let mainCoordinator = coordinatorFactory.createCoordinator(type: .main, navigationController: navigationController)
        children.removeAll()
        mainCoordinator.parentCoordinator = self
        children.append(mainCoordinator)
        mainCoordinator.start()
    }
    
    func startOnBoardingCoordinator() {
        guard let coordinatorFactory = self.coordinatorFactory else { return }
        let onBoardingCoordinator = coordinatorFactory.createCoordinator(type: .onBoarding, navigationController: navigationController)
        children.removeAll()
        onBoardingCoordinator.parentCoordinator = self
        children.append(onBoardingCoordinator)
        onBoardingCoordinator.start()
    }
    
    func showCheckUpdatePopup() {
        CheckAppStatus.shared.checkForUpdate().sink { [weak self] isUpdateNeed in
            if isUpdateNeed {
                // 업데이트 필요 팝업 표시
                self?.showUpdateAlert()
            } else {
                self?.startMainCoordinator()
            }
        }
        .store(in: &cancellables)
    }
    
    private func showUpdateAlert() {
        let alert = UIAlertController(title: "업데이트 필요", message: "새로운 버전이 출시되었습니다. 업데이트하시겠습니까?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "업데이트", style: .default) { _ in
            if let url = URL(string: "https://your-update-link.com") {
                UIApplication.shared.open(url)
            }
        })
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel) { _ in
            self.startMainCoordinator()
        })
        navigationController.topViewController?.present(alert, animated: true, completion: nil)
    }
}
