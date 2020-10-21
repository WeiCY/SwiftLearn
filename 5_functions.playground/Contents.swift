import UIKit

// 无参数无返回函数
func printHelloWorld() {
    print("hello world")
}
printHelloWorld()

// 无参数函数
func sayHelloWorld() -> String {
    return "hello world"
}
print(sayHelloWorld())

// 多参数函数
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return "hello again"
    } else {
        return sayHelloWorld()
    }
}

greet(person: "tom", alreadyGreeted: true)
greet(person: "jerry", alreadyGreeted: false)

// 有参数无返回值
func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")
// 打印“Hello, Dave!”

// 多重返回值函数
//func minMax(array: [Int]) -> (min: Int, max: Int) {
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//        } else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return (currentMin, currentMax)
//}
//
//let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
//print("min is \(bounds.min) and max is \(bounds.max)")
//// 打印“min is -6 and max is 109”

// 可选元组返回类型
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// 隐式返回的函数

// 任何一个可以被写成一行 return 语句的函数都可以忽略 return。
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))
// 打印 "Hello, Dave!"

func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))
// 打印 "Hello, Dave!"

// 默认参数值
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
}
/**
 将不带有默认值的参数放在函数参数列表的最前。
 一般来说，没有默认值的参数更加的重要，将不带默认值的参数放在最前保证在函数调用时，非默认参数的顺序是一致的，同时也使得相同的函数在不同情况下调用时显得更为清晰。
 */
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault = 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault = 12

// 可变参数
// 一个函数最多只能拥有一个可变参数。
// 变参数的传入值在函数体中变为此类型的一个数组
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// 返回 3.0, 是这 5 个数的平均数。
arithmeticMean(3, 8.25, 18.75)
// 返回 10.0, 是这 3 个数的平均数。

// 输入输出参数
// 只能传递变量给输入输出参数。你不能传入常量或者字面量，因为这些量是不能被修改的。
// 当传入的参数作为输入输出参数时，需要在参数名前加 & 符，表示这个值可以被函数修改。
// 输入输出参数不能有默认值，而且可变参数不能用 inout 标记。
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// 打印“someInt is now 107, and anotherInt is now 3”

// 输入输出参数和返回值是不一样的。上面的 swapTwoInts 函数并没有定义任何返回值，但仍然修改了 someInt 和 anotherInt 的值。输入输出参数是函数对函数体外产生影响的另一种方式。
// 个人理解 可以有返回值，也可以没有。返回和值改变关系。但是值会进行改变。

// 函数类型
// 下面两个都是 (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
// () -> Void
func printdHelloWorld() {
    print("hello, world")
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 5"

// 有相同匹配类型的不同函数可以被赋值给同一个变量，就像非函数类型的变量一样
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 6"

// 函数类型作为参数
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// 打印“Result: 8”

// 函数参数作为返回值
//func stepForward(_ input: Int) -> Int {
//    return input + 1
//}
//func stepBackward(_ input: Int) -> Int {
//    return input - 1
//}
//
//func chooseStepFunction(backward: Bool) -> (Int) -> Int {
//    return backward ? stepBackward : stepForward
//}

// 嵌套函数
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
