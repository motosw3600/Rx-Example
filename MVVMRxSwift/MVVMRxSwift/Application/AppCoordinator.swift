//
//  AppCoordinator.swift
//  MVVMRxSwift
//
//  Created by 박상우 on 2022/03/07.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = ViewController.instantiate(viewModel: MenuListViewModel(menuService: MenuService()))
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
