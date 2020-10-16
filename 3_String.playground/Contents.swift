import UIKit

// 字符串和字符

// 字符串字面量 用于为常量和变量提供初始值
let someString = "Some string literal value"
// 多行字符串字面量
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, please your Majesty?" he asked.
"Begin at the beginning," the King said gravely, "and go on till you come to the end; then stop."
"""
print(quotation)

// 反斜杠（\）作为续行符
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print(softWrappedQuotation)

// 为了让一个多行字符串字面量开始和结束于换行符，请将换行写在第一行和最后一行
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
print(lineBreaks)

// 缩进
let srappedQuotation = """
    The White Rabbit put on his spectacles.  "Where shall I begin,
        please your Majesty?" he asked.

    "Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(srappedQuotation)

// 字符串字面量的特殊字符
/**
 转义字符 \0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
 Unicode 标量，写成 \u{n}(u 为小写)，其中 n 为任意一到八位十六进制数且可用的 Unicode 位码。
 */

// 单行
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"             // $，Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥，Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖，Unicode 标量 U+1F496
// 多行
let threeDoubleQuotes = """
Escaping the first quote \"""Escaping all three quotes \"\"\"
"""
print(threeDoubleQuotes)

// 扩展字符串分隔符。
// 这样字符串中的特殊字符将会被直接包含而非转义后的效果
let catStr = #"Line 1 \nLine 2"#
print(catStr)
// 如果需要字符串文字中字符的特殊效果，请匹配转义字符（\）后面添加与起始位置个数相匹配的 # 符。
let nCatStr = #"Line 1 \#nLine 2"#
print(nCatStr)

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks)

// 初始化空字符串
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法
// 两个字符串均为空并等价。

if emptyString.isEmpty {
    print("Nothing to see here")
}
// 打印输出：“Nothing to see here”

// 字符串可变性
var variableString = "Horse"
variableString += " and carriage"
// variableString 现在为 "Horse and carriage"

for character in "Dog!🐶" {
    print(character)
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters) // 字符串可以通过传递一个值类型为 Character 的数组作为自变量来初始化：
print(catString)
// 打印输出：“Cat!🐱”

// 连接字符串和字符
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome 现在等于 "hello there"

var instruction = "look over"
instruction += string2
// instruction 现在等于 "look over there"

//let exclamationMark: Character = "!"
//welcome.append(exclamationMark)
//// welcome 现在等于 "hello there!"

// 如果你需要使用多行字符串字面量来拼接字符串，并且你需要字符串每一行都以换行符结尾，包括最后一行：
let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
// 打印两行:
// one
// twothree

let goodStart = """
one
two

"""
print(goodStart + end)
// 打印三行:
// one
// two
// three

// 字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message 是 "3 times 2.5 is 7.5"

print(#"Write an interpolated string in Swift using \(multiplier)."#)
// 打印 "Write an interpolated string in Swift using \(multiplier)."

// 计算字符数量
let unusualMenagerie = "🐫 123 🐶"
print(unusualMenagerie.count)


// 访问和修改字符串
//不同的字符可能会占用不同数量的内存空间，所以要知道 Character 的确定位置，就必须从 String 开头遍历每一个 Unicode 标量直到结尾。因此，Swift 的字符串不能用整数（integer）做索引。
// 个人总结 使用startIndex 获取第一个索引  endIndex获取字符串结束的后一个索引 不在字符串中 因为第一个不一定是0 切中间字节数由于不同编码可能不一致 就通过偏移来取字符
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
//greeting[greeting.endIndex] // 使用 endIndex 属性可以获取最后一个 Character 的后一个位置的索引 不能作为一个字符串的有效下标
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

// indices 会创建一个包含全部索引的范围（Range）
greeting.indices
for index in greeting.indices {
   print("\(greeting[index]) ", terminator: "")
}
// 打印输出“G u t e n   T a g ! ”

// 插入和删除
var welcomeStr = "Hello"
welcomeStr.insert("!", at: welcomeStr.endIndex)

welcomeStr.insert(contentsOf: " threr", at: welcomeStr.index(before: welcomeStr.endIndex))

welcomeStr.remove(at: welcomeStr.index(before: welcomeStr.endIndex))
let range = welcomeStr.index(welcomeStr.endIndex, offsetBy: -6)..<welcomeStr.endIndex
welcomeStr.removeSubrange(range)

