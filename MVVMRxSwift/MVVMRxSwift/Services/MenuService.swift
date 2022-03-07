//
//  MenuService.swift
//  MVVMRxSwift
//
//  Created by 박상우 on 2022/03/07.
//

import Foundation
import RxSwift

class MenuService {
    func fetchMenus() -> Observable<[Menu]> {
        return Observable.create { observer -> Disposable in
            
            guard let path = Bundle.main.path(forResource: "menu", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let menus = try JSONDecoder().decode([Menu].self, from: data)
                observer.onNext(menus)
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create { }
        }
    }
}
