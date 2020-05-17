import UIKit
import RxSwift

/*:
 # catchErrorJustReturn: error시 기본값 사용
 */

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let subject = PublishSubject<Int>()

subject
    .catchErrorJustReturn(-1) //error시에 설정했던 -1 이 전달된다.
    .subscribe { print($0) }
    .disposed(by: bag)

subject.onError(MyError.error) //error시에 설정했던 -1 이 전달된다.
