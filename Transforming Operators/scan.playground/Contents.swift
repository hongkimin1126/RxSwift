import UIKit
import RxSwift

/*:
 # scan: 중간 과정과 결과가 전부 필요시.
 */

let disposeBag = DisposeBag()

Observable.range(start: 1, count: 10)
    .scan(0, accumulator: +) //1~10까지의 합 --> 55
    .subscribe{print($0)}
    .disposed(by: disposeBag)
