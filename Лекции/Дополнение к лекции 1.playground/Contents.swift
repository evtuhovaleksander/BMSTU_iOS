import UIKit

//Еще немного про работу с optionals
var opt: Int? = nil
//print(opt) -- error

//работа с guard
//1
func printer1(int: Int?) {
    guard let int = int else { return } // если int == nil уходим
    print(int) // int тут имеет тип Int НЕ ОПЦИОНАЛЕН!!! -> можно печатать
}

//блок кода 1 идентичен следующему
func identicalPrinter1(int: Int?) {
    if int == nil {
        return
    } else {
        let nonOptInt: Int = int! //force unwrapping ЗАПРЕЩЕН!!!!!!!!
        print(nonOptInt)
    }
}

//работа с if let
//2
func printer2(int: Int?) {
    if let int = int {
        print(int) // int тут имеет тип Int НЕ ОПЦИОНАЛЕН!!! -> можно печатать
    } else {
        print(-1) // int == nil -> печатаем дефолтное значение
    }
}

//блок кода 2 идентичен следующему
func identicalPrinter2(int: Int?) {
    if int != nil {
        let nonOptInt: Int = int! //force unwrapping ЗАПРЕЩЕН!!!!!!!!
        print(nonOptInt)
    } else {
        print(-1)
    }
}

//блок кода 2 идентичен следующему
func identical2Printer2(int: Int?) {
    print(int ?? -1)
}

// опрератор ?? может использоваться сколько угодно раз
let optInt1: Int? = nil
let optInt2: Int? = nil
print(optInt1 ?? optInt2 ?? -1)
//трактуется так:
//печатай optInt1 если он не nil, иначе
//печатай optInt2 если он не nil, иначе печатай -1

//Немного про optional обьекты
class Printer {
    func printSomething() {
        print("something")
    }
}

var optionalPrinter: Printer? = nil
//optionalPrinter.printSomething() error Value of optional type 'Printer?' not unwrapped; did you mean to use '!' or '?'?
//обьект optionalPrinter надо сделать не optional используя guard или if let ...
//или использовать ?
optionalPrinter?.printSomething()
// если optionalPrinter != nil то делай принт, иначе ничего не делай


//Enum бывают разные
//Простые
enum Simple{
    case s1
    case s2
}

let a: Simple = .s1

//Опирающиеся на определенное значение (строки, числа итд)
enum IntEnum: Int {
    case ie1 = 1
    case ie2 = 2
}

var b: IntEnum = .ie1
print(b.rawValue)
//создавать такой инам можно по "сырому значению"
b = IntEnum(rawValue: 1) ?? .ie1

