
/*
1. Создать класс "IOSStudents",добавить ему property: dateOfBirth, skills. Для тренировки.
Создавайте свои структуры с разными видами свойств: сохраняемые/не сохраняемые, вычисляемые, свойства типа и т.д.
 */
import UIKit

class IOSStudents {
    var name: String
    var dateOfBirth: String
    
    init(name: String, dateOfBirth: String) {
        self.name = name
        self.dateOfBirth = dateOfBirth
    }
} 

class Skills: IOSStudents {
    var nameOfSpec: String
    var skills: [String]
    
    init(name: String, dateOfBirth: String, nameOfSpec: String, skills: [String]) {
        self.nameOfSpec = nameOfSpec
        self.skills = skills
        super.init(name: name, dateOfBirth: dateOfBirth)
    }
    var totalExperience: Int = 0 {
        willSet(newTotalExperience) {
            print("Ты уже изучаешь \(nameOfSpec) \(newTotalExperience) месяцев и за это время научился: \(skills)")
        }
        didSet {
            if totalExperience > oldValue {
                print("Время изучения увеличилось на \(totalExperience - oldValue) месяцев")
            }
        }
    }
}

var iosStud1 = Skills(name: "Jack", dateOfBirth: "06.03.1998", nameOfSpec: "IOS", skills: ["clousers", "functions"])
iosStud1.totalExperience = 2
iosStud1.skills.append("classes")
iosStud1.skills.append("Structure")
iosStud1.totalExperience = 4

/*
2. Написать структуру "CreateTriangle",с двумя свойствами - угол A,угол C. 
И создать 2 вычисляемых свойства - те же угол А,угол С. 
И если мы записываем значения в эти углы - результатом должно быть значение третьего угла.
Для простоты можно взять прямоугольный треугольник, сумма углов которого равна 180 градусов.
 */

struct CreateTriangle {

    var triangleA: Int
    var triangleC: Int
	
    var triangleB: Int? {
        if triangleA > 0 && triangleC > 0 {
            let result = 180 - triangleA - triangleC
            print(" Треугольник имеет углы: А - \(triangleA), B - \(result), C - \(triangleC)")
            return result
        } else {
            print("Такого треугольника не существует")
            return nil
        }
    }
}

var triangle = CreateTriangle(triangleA: 15, triangleC: 45)
triangle.triangleB
triangle.triangleA = 0
triangle.triangleC = 0
triangle.triangleB

/*
3. Создать структуру "Резюме", у которой есть такие свойства:
- Фамилия,
- Имя.
- Должность,
- Опыт,
- Контактные данные(телефон, емейл),
- О себе(можно записать какие-то пару предложений на выбор).
 */

struct VC {
    var surName: String
    let name: String
    var position: String
    var yearsOfExp: Int
    var contactInfo: (mobile: Int, email: String)
    var aboutMySelf: String
}

var worker1 = VC(surName: "Cute", name: "Alice", position: "IOS", yearsOfExp: 1, contactInfo: (79983567541, "aliceCute@gmail.com"), aboutMySelf: "....")
print(worker1)

/*
4. Задание на закрепление предыдущих тем:
Создать  журнал, что б можно было писать имя, фамилию и оценку
Поставить ограничения: имя и фамилия не выше 15 символов каждое.
И оценка не выше 5.
Если везде значения превышаться выдавать об этом Сообщения в консоль.
 */
 
struct Journal {

static let maxStr = 15
static let maxAver = 5

    var name: String {
        didSet {
            if name.count < Journal.maxStr {
                print("Ошибка в колисестве")
                name = oldValue
            }
        }
    }
	
    var surName: String {
        didSet {
            if surName.count < Journal.maxStr {
                print("Ошибка в колисестве")
                surName = oldValue
            }
        }
    }
	
    var average: Int {
        didSet {
            if average > maxAver {
                print("Неправильная оценка")
                average = oldValue
            }
        }
    }
}

var student = Journal(name: "Майкл", surName: "Вазовский", average: 4)
print(student)
student.average = 7
print(student)


/*
5. Написать класс,в котором есть 4 функции: 
-пустая, которая просто выводит сообщение через print,
- которая принимаете параметры и выводит их в консоль,
- которая принимает и возвращает параметры.
- которая принимает замыкание и распечатывает результаты в консоль
 */

class Coffee {

    var sugar: Bool
    var coffee:Bool
    var tea: Bool
    var milk: Bool
    
    init(sugar: Bool, coffee: Bool, tea: Bool, milk: Bool) {
        self.sugar = sugar
        self.coffee = coffee
        self.tea = tea
        self.milk = milk
    }
	
    func iWantCoffee() {
        print("Could you give me a cup of coffee?")
    }
	
    func makingCoffee() -> String {
        var typeOfDrink = ""
        switch (coffee, milk, tea) {
        case (true, true, false): typeOfDrink = "Капучино"
        case (true, false, false): typeOfDrink = "Американо"
        case(false, true, true): typeOfDrink = "Чай с молоком"
        case (false, false, true): typeOfDrink = "чай"
        default: typeOfDrink = "У нас нет данного напитка"
            }
        return typeOfDrink
        }
    
    func doYouWantSugar() -> Bool {
        guard sugar  else { return true }
        return false
        print("Я не хочу \(makingCoffee()) c caxаром")
    }
    
    func withSugar(quantity: Int) -> String {
        var answer = ""
        if makingCoffee() != "У нас нет данного напитка" {
            if sugar == true {
                answer = "Ваш \(makingCoffee()) с молоком и \(quantity) кусочками сахара"
            } else {
                answer =  "Ваш \(makingCoffee()) без сахара"
            }
        } else {
            answer = makingCoffee()
    }
        print(answer)
        return answer
    }
    
    func payment(action: () -> ()) {
        if makingCoffee() != "У нас нет данного напитка" {
        action()
        print("До свидания")
    } else {
        print("До свидания")
    }
    }
}

var drink1 = Coffee(sugar: true, coffee: true, tea: false, milk: true)
drink1.iWantCoffee()
drink1.makingCoffee()
drink1.doYouWantSugar()
drink1.withSugar(quantity: 5)
var sumOfDrink = { print ("С вас 200 рублей")}
drink1.payment(action: sumOfDrink)