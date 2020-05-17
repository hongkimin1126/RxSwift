import UIKit
import RxSwift

/*:
 # deferred: 조건에 맞춰서 방출
 */

let disposeBag = DisposeBag()
let animals = ["🐶", "🐱", "🐹", "🐰", "🦊", "🐻", "🐯"]
let fruits = ["🍎", "🍐", "🍋", "🍇", "🍈", "🍓", "🍑"]
var flag = true

let factory: Observable<String> = Observable.deferred{
    flag.toggle()
    
    if flag {
        return Observable.from(animals)
    } else {
        return Observable.from(fruits)
    }
    
}

factory.subscribe{print($0)}

factory.subscribe{print($0)}
