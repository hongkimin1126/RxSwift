import UIKit
import RxSwift

/*:
 # retryWhen : 사용자가 원할때만 재시도
 */

let bag = DisposeBag()

enum MyError: Error {
    case error
}

var attempts = 1

let source = Observable<Int>.create { observer in
    let currentAttempts = attempts
    print("START #\(currentAttempts)")
    
    if attempts < 3 {
        observer.onError(MyError.error)
        attempts += 1
    }
    
    observer.onNext(1)
    observer.onNext(2)
    observer.onCompleted()
    
    return Disposables.create {
        print("END #\(currentAttempts)")
    }
}

let trigger = PublishSubject<Void>()

source
    .retryWhen{ _ in trigger} //바로 재시도 하지 않고 밑에서 trigger.onNext(()) 할떄 재시도 한다.
    .subscribe { print($0) }
    .disposed(by: bag)


trigger.onNext(()) // 이때 재시도 한다.
