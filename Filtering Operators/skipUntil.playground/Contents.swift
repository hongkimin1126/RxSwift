import UIKit
import RxSwift

/*:
 # skipUntil: 조건 sync라고 생각 하면된다. 지정한 대상의 방출 이후에 자신이 방출된다.
 */

let disposeBag = DisposeBag()

let subject = PublishSubject<Int>()

let trigger = PublishSubject<Int>()

subject.skipUntil(trigger) // skipUntil(trigger)은 trigger가 전부 방출이 끝나야  그 후에 방출된된다.
    .subscribe{print($0)}
    .disposed(by: disposeBag)

subject.onNext(1) // 아직 trigger가 방출되지 않았기 때문에 방출되지 않고 trigger 이후 부터 방출이라 이 구문은 무용지물임.

trigger.onNext(0)

subject.onNext(2) // 위에 trigger가 방출이 끝나고 2가 방출된다.
