import UIKit
import RxSwift

/*:
 # startWith: Observable이 요소 방출전에 다른 항목들을 앞부분에 추가해준다. 주로 기본값이나 시작값을 지정할때 사용한다.
 */


let bag = DisposeBag()
let numbers = [1, 2, 3, 4, 5]

Observable.from(numbers)
    .startWith(0)
    .startWith(-1, -2)
    .startWith(-3) // 나중에 전달할수록 가장 먼저 방출된다.
    .subscribe{print($0)}
    .disposed(by: bag)
