import UIKit
import RxSwift

/*:
 # just
 */
// 옵져버블을 생성하는 연산자를 operator 이라함.

let disposeBag = DisposeBag()
let element = "😀"

Observable.just(element)
   .subscribe { event in print(event) }
   .disposed(by: disposeBag)

Observable.just([1, 2, 3])
   .subscribe { event in print(event) }
   .disposed(by: disposeBag)
