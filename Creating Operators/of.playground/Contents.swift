

import UIKit
import RxSwift

/*:
 of: 프러퍼티 여러개를 받아서 그대로 방출함. just는 한개만 방출.
 */

let disposeBag = DisposeBag()
let apple = "🍏"
let orange = "🍊"
let kiwi = "🥝"

Observable.of(apple, orange, kiwi)
   .subscribe { print($0) }
   .disposed(by: disposeBag)

Observable.of([1, 2], [3, 4], [5, 6])
   .subscribe { print($0) }
   .disposed(by: disposeBag)
