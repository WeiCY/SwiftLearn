import UIKit

// 闭包
/**
 闭包是自包含的函数代码块，可以在代码中被传递和使用。
 闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。
 */

// 闭包表达式
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    print("----s1 = \(s1)  ------s2 = \(s2)   ------")
    print(s1 > s2)
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames 为 ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// 缩写
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

reversedNames = names.sorted(by: {$0 > $1})

reversedNames = names.sorted(by: >)

// 尾随闭包
func someFunctionThatTakesAClosure(closure:() -> Void) {
    // 函数
}

// 不使用尾随闭包
someFunctionThatTakesAClosure(closure: {
    // 闭包主体
})

// 使用尾随闭包
someFunctionThatTakesAClosure {
    
}
