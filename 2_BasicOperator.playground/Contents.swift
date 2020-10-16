import UIKit

// 基本运算符
/**
 一元运算符：对单一对象操作，分为前置（如!a）和后置(如a!)
 二元运算符：操作两个对象，中置（如a+b）
 三元运算符：操作三个对象，有且只有一个（a？b：c）
 */

// 赋值运算符 =
let a = 1
var b = 2
b = a
let (x, y) = (1, 2)

//if a = b { // 无效
//
//}

// 算数运算符 + - * /
1 + 2       // 等于 3
5 - 3       // 等于 2
2 * 3       // 等于 6
10.0 / 2.5  // 等于 4.0

"hello, " + "world"  // 等于 "hello, world"

// 求余运算符 %
9 % 4    // 等于 1
-9 % 4   // 等于 -1
9 % 4  == 1
9 % -4 == 1

// 一元负号运算符 -
let three = 3
let minusThree = -three       // minusThree 等于 -3
let plusThree = -minusThree   // plusThree 等于 3, 或 "负负3"

// 一元正号运算符 +
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix 等于 -6

// 组合赋值运算符
var c = 1
c += 2
// a 现在是 3

// 比较运算符
1 == 1   // true, 因为 1 等于 1
2 != 1   // true, 因为 2 不等于 1
2 > 1    // true, 因为 2 大于 1
1 < 2    // true, 因为 1 小于2
1 >= 1   // true, 因为 1 大于等于 1
2 <= 1   // false, 因为 2 并不小于等于 1

/**
 如果两个元组的元素相同，且长度相同的话，元组就可以被比较。
 比较元组大小会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止。如果所有的值都相等，那么这一对元组我们就称它们是相等的。
 Bool 不能被比较，也意味着存有布尔类型的元组不能被比较。
 
 Swift 标准库只能比较七个以内元素的元组比较函数。如果你的元组元素超过七个时，你需要自己实现比较运算符。
 
 */
(1, "zebra") < (2, "apple")   // true，因为 1 小于 2
(3, "apple") < (3, "bird")    // true，因为 3 等于 3，但是 apple 小于 bird
(4, "dog") == (4, "dog")      // true，因为 4 等于 4，dog 等于 dog
("blue", -1) < ("purple", 1)       // 正常，比较的结果为 true
//("blue", false) < ("purple", true) // 错误，因为 < 不能比较布尔类型

// 三元运算符  问题 ? 答案 1 : 答案 2
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight 现在是 90

// 空合运算符 ??
// 空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解包，否则就返回一个默认值 b。表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致。
// a != nil ? a! : b // 是对他的简写

let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 非空，因此 colorNameToUse 的值为 "green"

// 区间运算符
// 闭区间运算符  a...b 包含a和b
for index in 1...5 {
    print("\(index)")
}
// 1 2 3 4 5

// 半开区间运算符 a..<b
for index in 1..<5 {
    print("\(index)")
}
// 1 2 3 4

// 单侧区间
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names[2...] {
    print(name)
}
// Brian Jack

for name in names[...2] {
    print(name)
}
// Anna Alex Brian

// 单侧半开区间
for name in names[..<2] {
    print(name)
}
// Anna Alex

// 逻辑运算符 ! && ||
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// 输出“ACCESS DENIED”

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出“ACCESS DENIED”

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出“Welcome!”
//    true                false               false           true
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出“Welcome!”

// Swift 逻辑操作符 && 和 || 是左结合的，这意味着拥有多元逻辑操作符的复合表达式优先计算最左边的子表达式。
// 为了易懂我们可以加上括号
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出“Welcome!”
