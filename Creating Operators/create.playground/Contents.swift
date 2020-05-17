import UIKit
import RxSwift

/*:
 # create: Observable을 커스터마이징
   주로 이거 많아 사용할듯.
 */

let disposeBag = DisposeBag()

enum MyError: Error {
    case error
}


Observable<String>.create{(observer) -> Disposable in
    
    guard let url = URL(string: "http://www.apple.com") else {
        observer.onError(MyError.error)
        return Disposables.create()
    }
    
    guard let html = try? String(contentsOf: url, encoding: .utf8) else {
        observer.onError(MyError.error)
        return Disposables.create()
    }
    
    observer.onNext(html) //onNext로
    observer.onCompleted()
    
    observer.onNext("After completed")
    
    return Disposables.create()
    
}
    .subscribe{print($0)}
    .disposed(by: disposeBag)
