// Задание: написать функцию, которая принимает строку как свой единсветнный параметр и возвращает true, если строка содержит уникальный символы
// Решение:

func uniqueCheck (input string: String) -> Bool {
    var checkedSymbols = [Character]()
	
    for i in string {
        if checkedSymbols.contains(i) {
            return false
        }
        checkedSymbols.append(i)
        print(checkedSymbols)
    }
	
    return true
}
print(uniqueCheck(input: "flower"))

    //second decision 
	
func uniqueCheck2(string input: String) -> Bool {
    return Set(input).count == input.count
}
print(uniqueCheck2(string: "stress"))

    //задание: Проверить, является ли строка палиндромом. Функция принимает строку и возвращает Bool
    // решение

func palindromeCheck(input string: String) -> Bool {
    let lowerCased = string.lowercased()
    return lowerCased == String(lowerCased.reversed())
}
print(palindromeCheck(input: "Kazak"))

    // написать функцию, которая принимает 2 строки и возвращает true, если эти строки содержат одни и те же символы в любом порядке с учетом регистра
	
func characterContain(string1 string1: String, string2 string2: String) -> Bool {
    for i in string1 {
        if (string2.contains(i) && string1.count == string2.count) {
            return true
        } else { break }
    }
    return false
}
print(characterContain(string1: "A1 b1", string2: "b1 a1"))

    // another decision 
    
func characterContain2(string1 string1: String, string2 string2: String) -> Bool {
    var checkString = string2
    for i in string1 {
        if let index = checkString.firstIndex(of: i) {
            checkString.remove(at: index)
        } else {
            return false
        }
    }
    return checkString.count == 0
}
print(characterContain2(string1: "frabhma", string2: "Frabhma"))
 
    // third desicion
	
func charactercontain3(string1 string1: String, string2 string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}
print(charactercontain3(string1: "Acb", string2: "bca"))


    // Задача 3. написать функцию, которая принимает одну строку и возвращает true, если эта строка полностью содержится в другой строке, игнорируя регистр.
    
    // Решение

import Foundation
var str1 = "Hello, Swift"
str1.contains(("Swift"))
extension String {
func containCheck(string1 string: String) -> Bool {
    return self.lowercased().contains(string.lowercased())
}
    }
print(str1.containCheck(string1: "hello"))

    // задача 5. Написать функцию, которая принимает строку и символ, а далее возвращает количество раз, которое данный символ встречается в строке, с учетом регистра

func countOfSymbols(symbol symbol: Character, inText str: String) -> Int {
    var count = 0
    for i in str {
        if i == symbol {
            count += 1
        }
    }
    return count
}
print(countOfSymbols(symbol: "a", inText: "aaa hello Roza!"))

    // 2 решение

func countOfSymbols2(symbol symbol: Character, inText str: String) -> Int {
    return str.reduce(0) {
        $1 == symbol ? $0 + 1 : $0
    }
}
// метод reduce
print(countOfSymbols2(symbol: " ", inText: "Hello, how are you?"))

    //задание 6. написать функцию которая принимает строку и возвращает ту же строку, но без повторяющихчя символов
	
func noRepeatSymb(string1 string1: String) -> (String) {
    var set = [Character]()
    for i in string1 {
        if !set.contains(i) {
            set.append(i)
        }
    }
    return String(set)
    }
print(noRepeatSymb(string1: "illustrations"))

    //2 method
	
func getUniqStr(string1 string1: String) -> String {
    var setStr = Set<Character>()
    return string1.filter{ setStr.insert($0).inserted }
}
print(getUniqStr(string1: "Hello"))

// задача 7: написать функцию, которая принимает строку как свой единственный параметр и возвращает ту же самую строку только с замененными множественными пробелами на единичный.

func noMoreSpace(string: String) -> String {
    var seenSpace = false
    var returnValue = " "
    for i in string {
        if i == " " {
            if seenSpace { continue }
            seenSpace = true
	    } else {
            seenSpace = false
        }
    returnValue.append(i)
    }
    return returnValue
}
print(noMoreSpace(string: " hello  "))

    //задание 8: Написать функцию, которая принимает 2 сироки и возвращает true если одна строка является вращением друго, с учетом регистра. 
	
func roundString(string1: String, roundStr: String) -> Bool {
    guard string1.count == roundStr.count else { return false }
    let combined = string1 + string1
    return combined.contains(roundStr)
}
print(roundString(string1: "String", roundStr: "ngngng"))

    //задание 9: написать функцию, которая принимает строку и возвращает true , если оно содержит все буквы от a до z( является панграммой)
	
func pangram(string: String) -> Bool {
    var set = Set(string.lowercased())
    let letters = set.filter {
        $0 >= "a" && $0 <= "z"
    }
    /*
    let string2 = string.lowercased()
    for letter in string2 {
        set2.insert(String(letter))
    }
 */
    return letters.count == 26
}
print(pangram(string: "The quick brown fox jumps over the lazy dog"))

    //задание 10:  Написать функцию, которя принимает строку и возвращает тюпл, содержащий число гласных и согласных букв

func tupleInt(string: String) -> (sumOfConsonant: Int, sumOfVowels: Int) {
    var sumOfConsonant = 0
    var sumOfVowels = 0
    for letter in string.lowercased() {
        switch letter {
        case "a", "e", "y", "i", "o", "u": sumOfVowels += 1
            case "q", "w", "r", "t", "p", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m": sumOfConsonant += 1
        default: break
        }
    }
    return (sumOfConsonant, sumOfVowels)
}
print(tupleInt(string: "Hello, my name is Rose"))


    //задание11: Написать функцию, которая принимает две строки и возвращает true, если они одинаковы по длине, но различаются по содержанию не более, чем на 3 буквы

func similarStr(string1: String, string2: String) -> Bool {
    guard string1.count == string2.count else { return false }
    let firstArray = Array(string1).sorted()
    let secondArray = Array(string2).sorted()
    var diff = 0
    for (index, letter) in firstArray.enumerated() {
        // enumerated() - возвращает пару (index, letter)
        if secondArray[index] != letter {
            diff += 1
            if diff == 4 {
                return false
            }
        }
    }
    return true
}
print(similarStr(string1: "Hello", string2: "Hlloe"))

    // другое решение

func similarStr2(str1: String, str2: String) -> Bool {
    guard str1.count == str2.count else { return false }
    return str1.filter {
        !str2.contains($0) 
    }.count <= 3
}
print(similarStr2(str1: "Hello", str2: "heffom"))


    // задание 12. необходимо отфильтровать магазины по прибыли (Назкая прибыль, высокая)
	
let shops: [String: Double] = ["Shop1": 21100, "Shop2": 31000, "Shop3": 10000, "Shop4": 40000, "Shop5": 17000]
func filtershops(shops: [String: Double], filter: (Double) -> Bool) -> [String: Double] {
    var filteredShops = [String: Double]()
    for (key, value) in shops {
        if filter(value) {
            filteredShops[key] = value
        }
    }
    return filteredShops
}

func lowProfit(profit: Double) -> Bool {
    if profit < 20000 {
        return true
    }
    return false
}

func highProfit(profit: Double) -> Bool {
    if profit > 20000 {
        return true
    }
    return false
}
let shopsLowProfit = filtershops(shops: shops, filter: lowProfit(profit:))
print(shopsLowProfit)

let shopsHighProfit = filtershops(shops: shops, filter: highProfit(profit:))
print(shopsHighProfit)
    // решение через замыкания 
let shopsLowProfitClouser = filtershops(shops: shops, filter: {$0 < 20000 }) // inline clouser
// если замыкание стоит вторым в принимаемых значениях, то

let shopsLowProfitClouser2 = filtershops(shops: shops) {
    $0 < 20000
} // inline clouser


let shopsHighProfitClouser = filtershops(shops: shops, filter: { (profit: Double) -> Bool in
    if profit > 20000 {
        return true
    }
    return false
})
// на консоль поиходит запроос и далее вызыввается клоужер
func requesrData(success:(_ result: Int) -> (), error:(_ text: String) -> ()) {
    // запрос...
    let response = false
    if response {
        success(10)
    } else {
        error("Error!")
    }
}
let result = requesrData(success: { (countPeople) in
    print(countPeople)
}) { (textError) in
    print(textError)
}
result


    // сортировка массива
var digits = [1, 4, 5, 23, 54, 7, 4, 2, 67, 4]
digits.sort { (item1, item2) -> Bool in
    return item1 < item2
}
print(digits)
    // упрощение 

var digits2 = [1, 4, 5, 23, 54, 7, 4, 2, 67, 4]
digits2.sort { $0 < $1 }
print(digits2)


var digits3 = [1, 4, 5, 23, 54, 7, 4, 2, 67, 4]
digits3.sort(by: <)
print(digits3)


    // clousers могут захватываать внешние переменные