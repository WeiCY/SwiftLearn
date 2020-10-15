import UIKit

/**
 Swift 包含了 C 和 Objective-C 上所有基础数据类型
 Swift 还增加了 Objective-C 中没有的高阶数据类型比如元组（Tuple）
 Swift 还增加了可选（Optional）类型，用于处理值缺失的情况。是 Swift 许多强大特性的重要组成部分。
 Swift 是一门类型安全的语言，这意味着 Swift 可以让你清楚地知道值的类型。类型安全可以帮助你在开发阶段尽早发现并修正错误。
 */

// 常量和变量
let maxNumOfAttempts = 5;
// maxNumOfAttempts = 2; 常量不能再次赋值
let maxNum: Int;
maxNum = 10; // 仅可以赋值一次

var currentNumOfAttempts = 2;
currentNumOfAttempts+=1;

let name = "John", phoneNum = "0377-84723322";
var cname = "Tom", cphoneNum = "087-82371278"
cname = "Blus"

// 类型注解
///如果要添加类型注解，需要在常量或者变量名后面加上一个冒号和空格，然后加上类型名称。
let message: String = "this is a message"
var blue, red, green: Double;

// 命名  常量和变量名可以包含任何字符，包括 Unicode 字符
/**
 常量与变量名不能包含数学符号，箭头，保留的（或者非法的）Unicode 码位，连线与制表符。也不能以数字开头，但是可以在常量与变量名的其他地方包含数字。
 一旦你将常量或者变量声明为确定的类型，你就不能使用相同的名字再次进行声明，或者改变其存储的值的类型。同时，你也不能将常量与变量进行互转。
 */
let 🐂 = "牛"
let π = 3.14159
let 你好 = "你好世界"

// 输出
print(message)
print("my name is \(name)")

// 注释

// 这是一个单行注释
/**
 这是多行注释
 多行注释
 注释
 */

/**
 多行注释1
 /**
 多行注释2
 */
 */

// 分号
//不强制要求你在每条语句的结尾处使用分号。当然，你也可以按照你自己的习惯添加分号。有一种情况下必须要用分号，即你打算在同一行内写多条独立的语句

// 整数
// 没有小数部分的数字，可以有符号（正、负、零）或者无符号（正、零）
// swift提供了 8、16、32、64位的有符号、无符号的整属类型 UInt8 Int32

// 通过max、min获取最大值最小值
let minValue = UInt8.min  // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max  // maxValue 为 255，是 UInt8 类型

// Int、UInt 是Swift 提供了一个特殊的整数类型 Int，长度与当前平台的原生字长相同。

// 浮点型
// 有小数部分的数字
// 浮点类型比整数类型表示的范围更大，可以存储比 Int 类型更大或者更小的数字。
// Double 表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。 至少有 15 位小数
// Float 表示32位浮点数。精度要求不高的话可以使用此类型。 6 位小数

let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17

// 数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

let intPi = Int(pi) // 用这种方式来初始化一个新的整数值时，浮点值会被截断。也就是说 4.75 会变成 4，-3.9 会变成 -3。

// 类型别名
typealias MyInt = Int8;
var theNum: MyInt = 12;

// 布尔类型
let orangesAreOrange = true
let turnipsAreDelicious = false

// 元组
let http404Error = (404, "Not Found")
let (respCode, respMsg) = http404Error;
print(respCode)
let (rspCode, _) = http404Error;
print("The status code is \(rspCode)")
print("The status code is \(http404Error.0)")
let http200Success = (code: 200, msg: "Success")
print(http200Success.msg)

// 可选类型
// 可选类型表示两种可能： 或者有值，你可以解析可选类型访问这个值，或者根本没有值。
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
print(convertedNumber)
let unPossibleNumber = "hellp"
let unConvertedNumber: Int? = Int(unPossibleNumber) // 被默认为Int？ 一个可选类型的Int
print(unConvertedNumber)

var serverResponseCode: Int? = 404
// serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil
// serverResponseCode 现在不包含值

// nil 不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。
let num: Int? = nil
var surveyAnswer: String? // 自动置为nil
/**
 Swift 的 nil 和 Objective-C 中的 nil 并不一样。
 在 Objective-C 中，nil 是一个指向不存在对象的指针。
 在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型。
 */

// if语句和强制解析
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
    
//    当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值。这个惊叹号表示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析（forced unwrapping）：
    print("convertedNumber has an integer value of \(convertedNumber!).")
} else {
    print("convertedNumber is nil.")
}

/**
 使用 ! 来获取一个不存在的可选值会导致运行时错误。使用 ! 来强制解析值之前，一定要确定可选包含一个非 nil 的值。
 */

//可选绑定




