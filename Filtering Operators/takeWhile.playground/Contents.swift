import UIKit
import RxSwift

/*:
 # takeWhile : true조건 동안만 방출 false나온순간부터 전부 버린다
 */

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


Observable.from(numbers)
    .takeWhile{!$0.isMultiple(of: 2)} //  true조건 동안만 방출이라서 여기서는 1만 방출됨. 2부터 전부 버림.
    .subscribe{print($0)}
    .disposed(by: disposeBag)
