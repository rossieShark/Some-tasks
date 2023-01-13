/*
 1. создать массив "дни в месяцах"

12 элементов содержащих количество дней в соответствующем месяце

используя цикл for и этот массив

- выведите количество дней в каждом месяце (без имен месяцев)

- используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней

- сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)

- сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)

- для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года 
*/

var daysOfMounths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
print(daysOfMounths)
var months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
print(months)

for i in 0..<months.count {
    print("in \(months[i]) is \(daysOfMounths[i]) days") 
}

/*
 //one of desecions 
for (index, value) in daysOfMounths.enumerated() {
    print("in \(months[index]) is \(value) days") 
}
 */
 
var bigMassive = [(String, Int)]()
for j in 0..<months.count {
    let month = (month: months[j], day: daysOfMounths[j])
    bigMassive.append(month)
   
}
print(bigMassive)


let dayOfBDay = (month:9, day: 20)
var days = 0
for k in 0..<dayOfBDay.month - 1 {
    days += daysOfMounths[k]
}
days += dayOfBDay.day
print(days)


    //reverse order

print(months)
months.reverse()
daysOfMounths.reverse()
print(months)
print(daysOfMounths)
    
    // ??
	
print()
print("Find sum of nils")
var nill = ["23", "45", "rr","22", "gg"]
var sum = 0
for i in 0..<nill.count {
    var optToInt = Int(nill[i]) ?? 0
    sum += optToInt
}
print(sum)

    // optional unrapping
	
print()
sum = 0
for i in 0..<nill.count {
    if Int(nill[i]) != nil{
        sum += Int(nill[i])!
    }
}
print(sum)

    //optional binding
print()
sum = 0
for i in 0..<nill.count {
    if var intOpt = Int(nill[i]) {
        sum += intOpt
    }
}
print(sum)

print()

    // Character transform to Int
let dictionary: [Character] = ["a", "b", "c","d", "e", "f", "g", "h", "i", "j","k","l","m","n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var dictStr = [String] ()
for i in 0..<dictionary.count {
    //print(dictionary[i])
    var str = String(dictionary[i])
    dictStr.append(str)
}
dictStr.reverse()
print(dictStr)

    //another option 

let dictionary2 = "abcdefghijklmnopqrstuvwxyz"
var array = [String]()
for char in dictionary2 {
    array.insert(String(char), at: 0)
}
print(array)