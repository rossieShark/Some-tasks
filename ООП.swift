
/*
1. Создать класс "люди", в этом классе 4 property - "имя", "рост", "вес", "пол", а также будет иметь метод "say(говорит)".
 */
protocol Speakers {
    func say() -> String
}

class Human {
    let name: String
    var height: Int
    var weight: Int
    let gender: String
    
    init(name: String, height: Int, weight: Int, gender: String) {
        self.name = name
        self.height = height
        self.weight = weight
        self.gender = gender
    }
    
    func say() -> String {
        return "Hello! My name is \(name)."
    }
}

/*
2. Создать sub class (наследники) "повар", "менеджер", "борец" и переопределить метод "say(говорит)" в каждом из этих классов.
 */

class Cook: Human {
    override func say() -> String {
        super.say() + " I'm a cook."
    }
}

class Manager: Human {
    override func say() -> String {
        super.say() + " I'm a manager."
    }
}

class Fighter: Human {
    override func say() -> String {
        super.say() + " I'm a fighter."
    }
}


/*
3. Создать по одному объекту(экземпляру) каждого класса  и объединить их в массив.
 */
 
var cook = Cook(name: "Luci", height: 167, weight: 50, gender: "Female")
cook.say()

var manager = Manager(name: "Ruben", height: 175, weight: 70, gender: "Male")
var fighter = Fighter(name: "Michael", height: 170, weight: 84, gender: "Male")

var proffArray = [cook, manager, fighter]
print(proffArray)

/*
4. В цикле “for in” пройти по всем элементам массива и вывести в консоль все характеристики каждого объекта (имя, рост и тд) и у каждого вызвать метод "say(говорит)".
 */

for proff in proffArray {
    print(proff.say())
}

    /*
5. Создать еще одного наследника от super Class, добавить в него пару новых свойств, добавить в массив и в цикле вывода вывести его свойства как дополнение к свойствам People.
 
6. Метод "say(говорит)" реализовать таким образом, чтобы перед тем как выполнить собственный method say, выполнялся сначала метод say класса People.
 */

 class Developer: Human {
 
 var speciality: String
 var exp: Double
 
    init(name: String, height: Int, weight: Int, gender: String, speciality: String, exp: Double) {
        self.speciality = speciality
        self.exp = exp
        super.init(name: name, height: (height), weight: weight, gender: gender)
    }
	
 override func say() -> String {
    super.say() + " I'm \(speciality) - developer with \(exp) years experience."
 }
 }
 
var iosDev = Developer(name: "Emma", height: 160, weight: 47, gender: "Female", speciality: "IOS", exp: 0.5)

proffArray.append(iosDev)

for proff in proffArray {
    print(proff.say())
}

/*
7. Вывести все это в обратном порядке(Google в помощь).
 */ 
 
 for proff in proffArray.reversed() {
    print(proff.say())
}

/*
8. Создать класс "Alien" (не наследник класса human!) со своими собственными property (отличными от people) и методом "say" (отличным от people).
 */

class Alien {

    let race: String
    var planet: String
    let quantityOfHands: Int
    
    init( race: String, planet: String, quantityOfHands: Int) {
        self.race = race
        self.planet = planet
        self.quantityOfHands = quantityOfHands
    }
    
    func say() -> String {
        "Say Hello and wave with \(quantityOfHands) hands."
    }
}

/*
9. Унаследоваться от него и создать пару других классов (Инопланетян) с переопределенным методом "say".
 */

class Martien: Alien {

    override func say() -> String {
        super.say() + "I'm from \(planet)"
    }
}


class Avtons: Alien {

    override func say() -> String {
        super.say() + "I'm from \(planet). Nice to meet you!"
    }
}


class Vulcan: Alien {

    override func say() -> String {
        super.say() + "I'm from \(planet). We'vecome with peace 🖖"
    }
}

var martien = Martien(race: "Martien", planet: "Mars", quantityOfHands: 4)
var avton = Avtons(race: "Avton", planet: "Polimer", quantityOfHands: 2)
var vulcan = Vulcan(race: "Vulcan", planet: "Volcano", quantityOfHands: 2)

/*
10. Объединить всех Human и Alien) в один массив.
 */
 
extension Human: Speakers {}
extension Alien: Speakers {}

var array = [cook, manager, fighter, iosDev, martien, avton, vulcan] as [Speakers]


/*
11. В цикле выводить тип объекта (Human или Alien) перед тем как выводить его свойства и вызывать метод
 */

for obj in array {
    if obj is Human {
        print((obj as! Human).name + " is a Human")
    } else {
        print((obj as! Alien).race + " is a Alien")
    }
    print(obj.say())
}

    /* 
12. Поместить всех Human в один массив, а Alien  в другой массив (количество Human и Alien должно быть разное)
 */

var human = [cook, manager, fighter, iosDev]
human.count
var alien = [martien, avton, vulcan]
alien.count


/*
13. В одном цикле “for in” выводить Human а потом Alien, доставая данные поочередно из двух разных массивов, если в одном из массивов объектов больше, то в конце должны выводиться только объекты этого массива (так как других уже нет)
 */

for i in 0..<human.count {
    print(human[i])
    if alien.count > i {
        print(alien[i])
    }
}

/*
14. Соединить Марсиан и People в одном массиве.
 */ 

var mixRaces: Array <Speakers> = alien + human

/*
15. Используя нужный метод array  отсортировать массив (как результат будет другой массив). 
 */
 
print(mixRaces.sorted(by: {$0.say() > $1.say()}))

    /*
16. Сортировать так: сначала Human, а потом Alien, люди отсортированы по имени, а Alien по расе.
 */

var sortedArray:Array <Speakers> = human.sorted(by: {$0.name < $1.name}) + alien.sorted(by: {$0.race < $1.race})
print(sortedArray)

for obj in sortedArray {
    if obj is Human {
        print((obj as! Human).name + " is a Human")
    } else {
        print((obj as! Alien).race + " is a Alien")
    }
}
