import UIKit

// 集合类型
/**
 三种基本集合类型 数组（Array）、集合（Set）和字典（Dictionary）
 数组是有序数据的集
 集合是无序无重复数据的集
 字典是无序的键值对的集
 
 三种类型必须明确其中保存的键和值类型
 */

// 数组
var someInts = [Int]()
someInts.append(3)
// someInts 现在包含一个 Int 值
someInts = []
// someInts 现在是空数组，但是仍然是 [Int] 类型的。

var threeDoubles = Array(repeating: "ddd", count: 4);
print(threeDoubles)

var anotherThreeDoubles = Array(repeating: "qe", count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

var shoppingList = ["Eggs","Milk"]
var music: [String] = ["天龙八部","七里香","longly"]
// 数量
print(shoppingList.count)

// 非空
if shoppingList.isEmpty {
    print("empty")
} else {
    print("not empty")
}

// 拼接、插入、删除
shoppingList.append("floor")
print(shoppingList.count)

shoppingList += ["Powder"]
print(shoppingList.count)

shoppingList += ["Spread", "Cheese", "Butter"]
print(shoppingList.count)

var firstItem = shoppingList[0]
shoppingList[0] = "six eggs"
print(shoppingList)

shoppingList[4...6] = ["xid","dad","wqe"]
print(shoppingList)
shoppingList[4...6] = ["okok"]
print(shoppingList)

shoppingList.insert("ih", at: 3)

// 不能超过数量
//shoppingList.insert("ih", at: 8)
print(shoppingList)

// 会得到删除的元素
let mapleSyrup = shoppingList.remove(at: 0)
print(mapleSyrup)
let apples = shoppingList.removeLast()
print(apples)

// 数组的遍历
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}

// 集合
var letters = Set<Character>()
letters.insert("a")
// letters 现在含有1个 Character 类型的值
letters = []
// letters 现在是一个空的 Set，但是它依然是 Set<Character> 类型
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// 可以简化 set必须要显示声明
var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]

// 数量
print(favoriteGenres1.count);

// 非空
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// 打印“I have particular music preferences.”

// 插入删除
favoriteGenres.insert("Jazz")
// favoriteGenres 现在包含4个元素

// 如果它是该集合的一个元素则删除它并且返回它的值，若该集合不包含它，则返回 nil。
if let removedGenre = favoriteGenres.remove("Roc2k") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// 打印“Rock? I'm over it.”

if favoriteGenres.contains("Rock") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

// 遍历
for genre in favoriteGenres {
    print("\(genre)")
}

// 没有确定的顺序，为了按照特定顺序来遍历一个集合中的值可以使用 sorted() 将会得到一个有序数组。
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]

let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

// 下面几个方法都会得到一个新的集合。
// 合并
oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

// 交集
oddDigits.intersection(evenDigits).sorted()
// []

// 不在另一个集合中的值创建一个新的集合
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]

// 两个集合不相交的值创建一个新的集合
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

// 集合成员关系和相等
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

if houseAnimals == farmAnimals {
    print("xiang deng")
} else {
    print("bu")
}

// 是不是子集合
houseAnimals.isSubset(of: farmAnimals)
// true
// 是不是父集合
farmAnimals.isSuperset(of: houseAnimals)
// true
// 是不是不含有相交的值
farmAnimals.isDisjoint(with: cityAnimals)
// true
farmAnimals.isDisjoint(with: houseAnimals)
// false

// 判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
houseAnimals.isStrictSubset(of: farmAnimals)
farmAnimals.isStrictSuperset(of: houseAnimals)

// 两者区别 两个集合是不是相等
houseAnimals.isSubset(of: houseAnimals)
houseAnimals.isStrictSubset(of: houseAnimals)
