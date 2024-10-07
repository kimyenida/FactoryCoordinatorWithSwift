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
    private var factory: SplashFactory
    private var cancellables = Set<AnyCancellable>()

    var children: [Coordinator] = []
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController, factory: SplashFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    
    func start() {
        showSplashViewController()
    }
    
    func showSplashViewController() {
        let splashViewController = factory.makeViewController(coordinator: self)
        self.navigationController.pushViewController(splashViewController, animated: false)
    }
    
    func startMainCoordinator() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController, factory: MainFactory())
        children.removeAll()
        mainCoordinator.parentCoordinator = self
        children.append(mainCoordinator)
        mainCoordinator.start()
    }
    
    func startOnBoardingCoordinator() {
        let onBoardingCoordinator = OnBoardingCoordinator(navigationController: navigationController, factory: OnBoardingFactory())
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
