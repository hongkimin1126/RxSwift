import UIKit
import RxSwift

/*:
 from: 배열에 있는 element를 하나씩 방출
 */


let disposeBag = DisposeBag()
let fruits = ["🍏", "🍎", "🍋", "🍓", "🍇"]

Observable.from(fruits)
   .subscribe { print($0) }
   .disposed(by: disposeBag)
