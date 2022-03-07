//
//  MenuService.swift
//  MVVMRxSwift
//
//  Created by 박상우 on 2022/03/07.
//

import Foundation
import RxSwift

protocol MenuServiceImpl {
    func fetchMenus() -> Observable<[Menu]>
}

class MenuService: MenuServiceImpl {
    func fetchMenus() -> Observable<[Menu]> {
        return Observable.create { observer -> Disposable in
            
            guard let jsonString = LocalFileManager.readJsonFile("menu"),
                  let data = jsonString.data(using: .utf8) else {
                      return Disposables.create { }
                  }
            
            do {
                let menus = try JSONDecoder().decode([Menu].self, from: data)
                observer.onNext(menus)
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create { }
        }
    }
}
