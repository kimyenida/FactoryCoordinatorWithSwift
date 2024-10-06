//
//  SplashCoordinator.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class SplashCoordinator: Coordinator {
    weak var parendCoordinator: Coordinator?
    private var factory: SplashFactory
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, factory: SplashFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func showSplashViewController() {
        let splashViewController = factory.makeSplashViewController(coordinator: self)
        self.navigationController.pushViewController(splashViewController, animated: false)
    }
    
    func startMainCoordinator() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController, factory: MainFactory())
        children.removeAll()
        mainCoordinator.parendCoordinator = self
        children.append(mainCoordinator)
        mainCoordinator.showMainViewController()
    }
    
    func startOnBoardingCoordinator() {
        let onBoardingCoordinator = OnBoardingCoordinator(navigationController: navigationController, factory: OnBoardingFactory())
        children.removeAll()
        onBoardingCoordinator.parendCoordinator = self
        children.append(onBoardingCoordinator)
        onBoardingCoordinator.showOnBoardingViewController()
    }
    
    func showCheckUpdatePopup() {
        CheckAppStatus.shared.checkForUpdate().sink { [weak self] isUpdateNeed in
            if isUpdateNeed {
                // 업데이트 필요 팝업 표시
                let alert = UIAlertController(title: "업데이트 필요",
                                              message: "새로운 버전이 출시되었습니다. 업데이트하시겠습니까?",
                                              preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "업데이트", style: .default) { _ in
                    // 업데이트 링크를 열거나 업데이트를 시작하는 로직 추가
                    if let url = URL(string: "https://your-update-link.com") {
                        UIApplication.shared.open(url)
                    }
                })
                
                alert.addAction(UIAlertAction(title: "취소", style: .cancel) { _ in
                    // 업데이트를 원하지 않는 경우 처리
                    self?.startMainCoordinator()
                })
                
                // 현재의 최상위 뷰 컨트롤러에 팝업을 표시
                if let topVC = self?.navigationController.topViewController {
                    topVC.present(alert, animated: true, completion: nil)
                }
            } else {
                self?.startMainCoordinator()
            }
        }
    }
}
