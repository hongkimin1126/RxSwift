import UIKit
import RxSwift

/*:
 # takeUntil: 지정한 놈이 방출 시작하는 순간부터는 더 이상 방출 할수없다.
 */

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let subject = PublishSubject<Int>()
let trigger = PublishSubject<Int>()

subject.takeUntil(trigger) // trigger가 방출되는 순간부터 subject는 더이상 요소를 방출하지 않는다.
    .subscribe{print($0)}
    .disposed(by: disposeBag)

subject.onNext(1)
subject.onNext(2)

trigger.onNext(0) // trigger가 방출되는 순간부터 subject는 더이상 요소를 방출하지 않는다.
