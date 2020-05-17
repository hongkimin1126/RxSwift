import UIKit
import RxSwift

/*:
 # skip: 특정 요소를 무시.
 */

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]



Observable.from(numbers)
    .skip(3) // ()과로 안에가 count라서 1,2,3,을 스킵하고 4부터 출력된다.
    .subscribe{print($0)}
    .disposed(by: disposeBag)
