import UIKit
import RxSwift

/*:
 # skipWhile: filter 연산자와 다르게 false가 되면 해당부분 부터 모두 방출한다.
 */

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Observable.from(numbers)
    .skipWhile{ !$0.isMultiple(of: 2) } // 2부터 false가 되면서 전부 방출된다. 필터와는 다르다.
    .subscribe{print($0)}
    .disposed(by: disposeBag)
