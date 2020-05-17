import UIKit
import RxSwift

/*:
 # take: 앞에서 부터 지정된 count의 갯수 만큼 방춤.
 */

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]



Observable.from(numbers)
    .take(5) // 앞에서 부터 5개만 방출하라는 것  --> 1~5까지 출력후 completed가 출력됨
    .subscribe{print($0)}
    .disposed(by: disposeBag)
