import UIKit
import RxSwift

/*:
 # range : 정수를 지정된 수만큼 방출
 */

let disposeBag = DisposeBag()

Observable.range(start: 1, count: 10) //1~10까지 10개 방출
   .subscribe { print($0) }
   .disposed(by: disposeBag)
