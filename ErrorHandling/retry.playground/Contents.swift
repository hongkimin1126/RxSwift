import UIKit
import RxSwift

/*:
 # retry: error시에 재시도
 1) retry()//파리미터를 안넣으면 옵져버블이 완료될때까지 계속해서 무한 재시도 한다. -> 가능하면 쓰지 말것
 2) .retry(<#T##maxAttemptCount: Int##Int#>): 최대 실행횟수 --> 생각한 횟수에 + 1 한 값을 지정!!!!!!
 */

let bag = DisposeBag()

enum MyError: Error {
    case error
}

var attempts = 1

let source = Observable<Int>.create { observer in
    let currentAttempts = attempts
    print("#\(currentAttempts) START")
    
    if attempts < 3 {
        observer.onError(MyError.error)
        attempts += 1
    }
    
    observer.onNext(1)
    observer.onNext(2)
    observer.onCompleted()
    
    return Disposables.create {
        print("#\(currentAttempts) END")
    }
}

source
    //    .retry()//파리미터를 안넣으면 옵져버블이 완료될때까지 계속해서 무한 재시도 한다. -> 가능하면 쓰지 말것.
    .retry(7)//최대 실행횟수 --> 생각한 횟수에 + 1 한 값을 지정!!!!!!
    .subscribe { print($0) }
    .disposed(by: bag)
