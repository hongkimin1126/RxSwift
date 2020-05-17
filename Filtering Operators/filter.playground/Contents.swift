import UIKit
import RxSwift

/*:
 # filter: 특정 조건만 필터링 하겠다.
 */


let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


Observable.from(numbers)
    .filter{$0.isMultiple(of: 2)} // 2의 배수만 필터해서 방출시키겠다.
    .subscribe{print($0)}
    .disposed(by: disposeBag)
