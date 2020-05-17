import UIKit
import RxSwift

/*:
 # single: 원본 옵져버블에서 첫번째 요소만 방출하거나 조건있을시 조건에 충족하는 첫번째 요소 방출.
 */

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


Observable.just(1) // 있는 그대로 방출 여기서는 1을 방출.
    .single()
    .subscribe{print($0)}
    .disposed(by: disposeBag)

Observable.from(numbers)
    .single{$0 == 3} //여기서는 3만 방출됨. array에 3이 두개라면 error이 반환됨.
    .subscribe{print($0)}
    .disposed(by: disposeBag)

let subject = PublishSubject<Int>()

subject.single()
    .subscribe{print($0)}
    .disposed(by: disposeBag)

subject.onNext(100) //subject는 100만 출력되고 뒤에 onNext가 더 생긴다면 error이 반환된다.

subject.onNext(101) // 위에 하나만 방출해야 하는데 또 onNext 방출한거라서 error이 반환.
