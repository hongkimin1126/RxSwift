import UIKit
import RxSwift
import RxCocoa

/*:
 # Relay
 */

//Relay: RXSwift는  Subject를 wraping 하고 있는 두가지 relay를 제공함.
//Relay는 completed와 error이벤트는 받지 않고 next이벤트만 받음. 주로 종료 없이 계속전달되는 이벤트 시퀸스를 처리할때 사용.
//-PublishRelay: PublishSubject를 wraping
//-BehaviorRelay: BehaviorSubject를 wraping
//- 구독자가 종료되기 전까지 종료되지 않음.
//- 주로 UI이벤트를 처리함.
//MARK: 중요!!!! Relay는 import RxCocoa 해야한다.

let bag = DisposeBag()


let prelay = PublishRelay<Int>()

prelay.subscribe{ print("1: \($0)")}.disposed(by: bag)

prelay.accept(1) //Relay는 OnNxt 대신해서 accept를 사용하여 next이벤트를 전달한다.

let brelay = BehaviorRelay(value: 1)


brelay.subscribe{ print("2: \($0)")}.disposed(by: bag)

brelay.accept(2)
brelay.accept(3)

print(brelay.value)
