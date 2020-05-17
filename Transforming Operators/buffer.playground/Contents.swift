import UIKit
import RxSwift

/*:
 # buffer
 */


let disposeBag = DisposeBag()


//옵져버블은 1초마다 방출하고 있고, 버퍼는 2초마다 3개씩 수집하고 있다.
Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
    .buffer(timeSpan: .seconds(2), count: 3, scheduler: MainScheduler.instance) //쵀대 2초마다 , 최대 3개까지 방출, 시간을 아무리 늘려도 카운트가 3개라서 3개만 방츨
    .take(5)
    .subscribe{print($0)}
    .disposed(by: disposeBag)
