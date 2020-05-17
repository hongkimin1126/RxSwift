import UIKit
import RxSwift

/*:
 # distinctUntilChanged: 바로 연속으로 방출되는 값이 바로 이전돠 중복되면 제거해준다. 전체에서 중복제거 해주는것이 아니다.
 */



let disposeBag = DisposeBag()
let numbers = [1, 1, 3, 2, 2, 3, 1, 5, 5, 7, 7, 7]

Observable.from(numbers)
    .distinctUntilChanged() //비로 이전 값과 같다면 중복제거.
    .subscribe {print($0)}
    .disposed(by: disposeBag)
