import UIKit
import RxSwift

/*:
 # timer
 */


let bag = DisposeBag()

// 중요 !!! timer에서 seconds(1)는 주기의 의미가 아니다. 1번째 방출값이 구독자에게 도달하는 시간을 의미한다.
// 주기는 period가 관리한다. 밑에서는 microseconds(500)라 0.5초의 주기임.
// period 안쓰면 1번만 방출되고 끝이다.
Observable<Int>.timer(.seconds(1),period: .microseconds(500), scheduler: MainScheduler.instance)
    .subscribe{print($0)}
    .disposed(by: bag)
