import UIKit

// 控制流

// For-In循环
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// cats have 4 legs
// ants have 6 legs
// spiders have 8 legs

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

// 可忽略当前序号值
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// 输出“3 to the power of 10 is 59049”

let minutes = 60
for tickMark in 0..<minutes {
    // 每一分钟都渲染一个刻度线（60次）
    print(tickMark)
}

// 等间隔 跳过 to 不包含 through 包含
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: 5) {
    print(tickMark)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // 每3小时渲染一个刻度线（3, 6, 9, 12）
    print(tickMark)
}

// While循环

// while 循环从计算一个条件开始。如果条件为 true，会重复运行一段语句，直到条件变为 false。
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare+1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0

//// 先执行一次 在进行判断
//while square < finalSquare {
//    // 掷骰子
//    diceRoll = (Int)(arc4random()%6+1)
//    square += diceRoll
//    // 移动
//    print(diceRoll,square)
//    if square < board.count {
//        // 如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
//        square += board[square]
//    }
//}
//print("Game over")

// repeat-while
// repeat-while，它和 while 的区别是在判断循环条件之前，先执行一次循环的代码块。然后重复循环直到条件为 false。
repeat {
    // 先判断是否在梯子和蛇
    square += board[square]
    
    // 掷骰子
    diceRoll = (Int)(arc4random()%6+1)
    square += diceRoll;
    
} while square < finalSquare
print("Game over")


// 条件语句
// 当条件较为简单且可能的情况很少时，使用 if 语句。
// switch 语句更适用于条件较复杂、有更多排列组合的时候。并且 switch 在需要用到模式匹配（pattern-matching）的情况下会更有用。

// If
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
// 输出“It's very cold. Consider wearing a scarf.”

// If-else
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// 输出“It's not that cold. Wear a t-shirt.”

// If-else if
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// 输出“It's really warm. Don't forget to wear sunscreen.”

// Switch

// 不需要添加break

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// 输出“The last letter of the alphabet”


let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// 输出“The letter A”


let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// 输出“There are dozens of moons orbiting Saturn.”


// Swift 允许多个 case 匹配同一个值 如果存在多个匹配，那么只会执行第一个被匹配到的 case 分支
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// 输出“(1, 1) is inside the box”

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// 输出“on the x-axis with an x value of 2”

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// 输出“(1, -1) is on the line x == -y”

//let someCharacter: Character = "e"
//switch someCharacter {
//case "a", "e", "i", "o", "u":
//    print("\(someCharacter) is a vowel")
//case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
//     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
//    print("\(someCharacter) is a consonant")
//default:
//    print("\(someCharacter) is not a vowel or a consonant")
//}
// 输出“e is a vowel”

// 复合匹配同样可以包含值绑定。复合匹配里所有的匹配模式，都必须包含相同的值绑定。并且每一个绑定都必须获取到相同类型的值。
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// 输出“On an axis, 9 from the origin”


// 控制转移语句
// continue、break 、fallthrough 、return（ 函数 ）、throw （ 错误抛出 ）

// Continue
// continue 语句告诉一个循环体立刻停止本次循环，重新开始下次循环。

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        // 对元音不进行任何操作 等同于 puzzleOutput.append("")
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)
    // 输出“grtmndsthnklk”

// Break
// break 语句会立刻结束整个控制流的执行。break 可以在 switch 或循环语句中使用，用来提前结束 switch 或循环语句。

// 会立刻中断该循环体/Switch的执行，然后跳转到表示循环体/Switch结束的大括号（}）后的第一行代码

let numberSymbol: Character = "三"  // 简体中文里的数字 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// 输出“The integer value of 三 is 3.”

// Fallthrough
// 与c语言要求书写break不一致，Swift中默认不会落入到下一个分支，要想延续c的特性就需要Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
    
// fallthrough 关键字不会检查它下一个将会落入执行的 case 中的匹配条件。fallthrough 简单地使代码继续连接到下一个 case 中的代码,会进行下一个结果，不论是否匹配
//case 6:
//    print("dddddd")
default:
    description += " an integer."
}
print(description)
// 输出“The number 5 is a prime number, and also an integer.”


// 带标签的语句

