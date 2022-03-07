//
//  MenuViewModel.swift
//  MVVMRxSwift
//
//  Created by 박상우 on 2022/03/07.
//

import Foundation
import RxSwift

final class MenuListViewModel {
    let title = "Restaurants"
    
    private let menuService: MenuServiceImpl
    
    init(menuService: MenuServiceImpl) {
        self.menuService = menuService
    }
    
    func fetchMenuViewModels() -> Observable<[MenuViewModel]> {
        return menuService.fetchMenus().map { $0.map {
            MenuViewModel.init(menu: $0) } }
    }
}
