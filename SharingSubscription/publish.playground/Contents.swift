import UIKit
import RxSwift

/*:
 # publish: multicast와 기능을 동일하다 하나의 시퀸스를 시용한다. multicast 다른점은 subject가 생략가능하다.
 */

let bag = DisposeBag()
let source = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance).take(5).publish()

source
    .subscribe { print("🔵", $0) }
    .disposed(by: bag)

source
    .delaySubscription(.seconds(3), scheduler: MainScheduler.instance)
    .subscribe { print("🔴", $0) }
    .disposed(by: bag)

source.connect()
