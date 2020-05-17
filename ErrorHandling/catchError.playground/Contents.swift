import UIKit
import RxSwift

/*:
 # catchError
 */
//catchError: error이 전달 되었을때 대체 옵져버블을 사용.

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let subject = PublishSubject<Int>()
let recovery = PublishSubject<Int>()

subject
    .catchError{ _ in recovery } //error이 전달 되었을때 대체 옵져버블을 사용.
    .subscribe { print($0) }
    .disposed(by: bag)

subject.onError(MyError.error)

subject.onNext(11) // 바로 위에서 error이 전달 되었기 때문에 무용지물 코드.

recovery.onNext(22) // catchError 를 사용 했기 때문에 recovery는 문제 없이 사용가능.
recovery.onCompleted()
