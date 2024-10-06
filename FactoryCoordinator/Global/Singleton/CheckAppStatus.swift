//
//  CheckAppStatus.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import Foundation
import Combine

class CheckAppStatus {
    static let shared = CheckAppStatus()
    
    func checkFirstInstall() -> AnyPublisher<Destination, Never> {
        let userDefault = UserDefaults.standard
        let isFirstInstall = userDefault.string(forKey: "isFirstInstall")
        
        if isFirstInstall == nil {
            userDefault.set("installed", forKey: "isFirstInstall")
            return Just(Destination.onBoarding).eraseToAnyPublisher()
        } else {
            return Just(Destination.main).eraseToAnyPublisher()
        }
    }
    
    // 버전 업데이트 check
    func checkForUpdate() -> AnyPublisher<Bool, Never> {
        return Just(true).eraseToAnyPublisher()
    }
}
