//
//  SplashViewController.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class SplashViewController: UIViewController {
    private let viewModel: SplashViewModel?
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        print("deintintintinitnitnintintinti")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        viewModel?.start()
        NotificationCenter.default.addObserver(self, selector: #selector(enterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playSplashVideo()
    }
    
    // splash video 재생
    private func playSplashVideo() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.viewModel?.checkInitialSetUp()
        })
    }
    
    @objc
    private func enterForeground() {
        print("enter foreground splashViewController")
        self.viewModel?.triggerPublisher.send(.main)
    }
}
