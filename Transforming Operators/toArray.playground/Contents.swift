import UIKit
import RxSwift

/*:
 # toArray : 방출 한것들을 전부 모아서 array로 만들어서 방출해준다.
 */

let disposeBag = DisposeBag()

let subject = PublishSubject<Int>()

subject
    .toArray()
    .subscribe{print($0)}
    .disposed(by: disposeBag)

subject.onNext(1)
subject.onNext(2)
subject.onCompleted() //[1,2]가 방출된다.
