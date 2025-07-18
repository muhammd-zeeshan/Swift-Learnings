
import Foundation


/// MARK: OOPs (object oriented programming) in Swift.



// 🔷 Swift OOP Topics Overview
/*
   1.  Class and Object
 
   2.  Properties and Methods
 
   3.  Encapsulation
 
   4.  Inheritance
 
   5.  Polymorphism
 
   6.  Abstraction
 
   7.  Initialization (Constructor)
 
   8.  Deinitialization
 
   9.  Access Control (private, public, etc.)
 
   10. Reference vs Value Types (Struct vs Class)
*/



// MARK: --------------- Leasson 1: Classes and Object in Swift ------------------ \\


// 🔸 Theory (Simple Words):

// Classes ek blueprint hoti hai - jismay hum batatay hein k kisi cheez ka structure kesa hoga. -- Object us class ka real instance or example hota ha, Jo memory mein create hota ha aur jisko hum use kar sakte hein.


// 🔸 Real-Life Example:
// Soochiyeh hum ek Car showroom mein hein, Har Car ka design same hota hai (like doors, engine, color), leikin har car alag alag instance hoti hai.

class Car {
    var color: String
    var model: String
    
    init(color: String, model: String) {
        self.color = color
        self.model = model
    }
    
    
    func startEngine() {
        print("The \(model) car with \(color) color engine started!")
    }
}


let car1 = Car(color: "Red", model: "Civic")
let car2 = Car(color: "Blue", model: "Corolla")

car1.startEngine()
car2.startEngine()


// 🔸 Interview Level Clarity:

/*
    Term              Description
    ----------------------------------------------------------------------------------------
     class            Defines Structure and behavior of an object
    ----------------------------------------------------------------------------------------
     object           Instance of the class, created using let or var
    ----------------------------------------------------------------------------------------
     init             Constructor - used to initailize the properties when object is created
    ----------------------------------------------------------------------------------------
     self              Refers to the current object (used inside class)
    ----------------------------------------------------------------------------------------
*/





// MARK: -------------------- Lesson 2: Properties and methods in Swift (OOP) --------------------- \\


// . Preperties -> Class k andar variable ya constant hoti hain jo Object ki state(halat) batate hein.

// . Mothods -> Class k andar functions hotay hein jo object ka behaviour (kaam) define kartay hein.


// 🔸 Real-Life Example:

// Misaal k tor pr aik fan banate hein.

/*
  Uski properties ho sakti hein
  
  . Speed
  . color
  . isOn
 
  Aur methods ho saktay hein
  
  . turnOn()
  . turnOff()
  . changeSpeed()
*/


class Fan {
    // Preperties (state)
    var speed: Int
    var color: String
    var isOn: Bool = false
    
    init(speed: Int, color: String) {
        self.speed = speed
        self.color = color
    }
    
    // Methods (behavior)
    
    func turnOn() {
        isOn = true
        print("Fan is ON.")
    }
    
    func turnOff() {
        isOn = false
        print("Fan is OFF.")
    }
    
    func changeSpeed(to newSpeed: Int) {
        speed = newSpeed
        print("Fan speed is changed to \(speed).")
    }
}


// 🔸 Object Create Karna (Fan Use Karna):

let myFan = Fan(speed: 3, color: "White")

myFan.turnOn()
myFan.changeSpeed(to: 5)
myFan.turnOff()






// MARK: -------------------- Lesson 3: Encapsulation in Swift (OOP) --------------------- \\


// 🔸 Theory (Simple Words):

/*
   Encapsulation ka matlab ha: Apni class ke data ko protect karna - aur allowed methods k through hi access dena.
 
   Yani:
     •    Data ko hide karo (jaise locker mein paisay rakhna).
     •    Sirf key (methods) ke zariye access do.
   
*/


// 🔸 Swift Code Example (Before Encapsulation):

class BankAccount {
    var balance: Double = 0.0   // its not private that's why anyone openly access
    
    func deposit(amount: Double) {
        balance += amount
    }
    
    func withDraw(amount: Double) {
        if amount <= balance {
            balance -= amount
        } else {
            print("Insufficient funds")
        }
    }
}

let myAccount = BankAccount()
myAccount.balance = 5000  // Direct Access! Wrong use
// 👆 Yeh unsafe hai — koi bhi balance ko directly change kar sakta hai.



// 🔸 Swift Code Example (With Encapsulation ✅):

class BankAccount2 {
    private var balance: Double = 0.0   // Hiding Data.
    
    // Public method to add money
    func deposit(amount: Double) {
        if amount > 0 {
            balance += amount
        }
    }
    
    // Public method to with draw money
    func withDraw(amount: Double) {
        if amount <= balance {
            balance -= amount
        } else {
            print("Insufficient funds")
        }
    }
    
    // Getter method
    func getBalance() -> Double {
        return balance
    }
}

let myAccount2 = BankAccount2()
myAccount2.deposit(amount: 2000)
myAccount2.withDraw(amount: 1000)
print("Balance \(myAccount2.getBalance())")  // ✅ Access via method


/*
 ✅ Summary:
     •    Encapsulation protects data from misuse.
     •    Use private to hide internal variables.
     •    Use methods to provide controlled access
*/






// MARK: -------------------- Lesson 4: Inheritance in Swift (OOP) --------------------- \\


/*   🔸 Theory (Simple Words):
 
   Inheritance means Sharing code from parent to child class

 
   Inheritance ka matlab hai:
   Ek child class kisi dosri parent class ki properties or methods inherit karti hai.
 
   Yni:
   Bachay apne parent ke kuch features le kar paida hotay hein,
   Programming mein bhi, ek child class parent class ke features reuse karti hai - bina dubara likhay.

*/


// 🔸 Real-Life Example:

// Soochiyeh aik vehicle class hai.

/*
   . Uske common features hein:
     . speed
     . color
     . start()
 
   Ab aap chahte ho ke Car, Bike, Truck ye sab vehicle hoon - lekin apni apni khas baat bhi rakhein.
*/


class Vehicle {
    var speed: Int
    var color: String
    
    init(speed: Int, color: String) {
        self.speed = speed
        self.color = color
    }
    
    func start() {
        print("Vehicle started aat spped \(speed)")
    }
}


// Sub-Class (Child)
class Car2: Vehicle {
    var brand: String
    
    init(speed: Int, color: String, brand: String) {
        self.brand = brand
        super.init(speed: speed, color: color) // Call parent init
    }
    
    func honk() {
        print("\(brand) is honking 🚗")
    }
}


// 🔸 Object Usage:
let myCar = Car2(speed: 120, color: "Red", brand: "Toyota")

myCar.start()  // Inherited method
myCar.honk()   // Child's own method

// ✅ Car class ne Vehicle se speed, color, aur start() inherit kiya.


/*  ✅ Summary:
   Inheritance means: Ek class doosri class ke features use karti hai,
*/






// MARK: -------------------- Lesson 5: Polymorphism in Swift (OOP) --------------------- \\

// 🔸 Theory (Asaan Alfaaz Mein):

/*
    Polymorphism ka matlab hai:
    
    "One Name, multiple behaviors"
    
    Yni ek hi method yn function alag alag classes mein different behavior yni tareekon sa kaam kare.

 
    Word ka matlb bhi yehi hota ha:
    
    . Poly = many
    . Morph = forms(shaklain, treeqay)
*/



// 🔸 Real-Life Example:
/*
   Soochiyeh hamaray paas ek class ha Animal jismay aik method ha makeSound().
 
   Lekin:
   . Agar object Dog ho to makeSound() -> "Bark"
   . Agar object Cat ho to makeSound() -> "Meow"
 
   Ek hi method ka naam but behavior object ke type ke mutabiq badal jaye, Yehi ha polymorphism.
*/


// Example With Swift Code:

class Animal {
    
    func makeSound() {
        print("Animal makes a sound")
    }
    
}

// Subclass 1.
class Dog: Animal {
    
    override func makeSound() {
        print("Dog barks 🐶")
    }
}

// Subclass 2.
class Cat: Animal {
    
    override func makeSound() {
        print("Cat meows 🐱")
    }
    
}


// 🔸 Usage:
let myAnimals: [Animal] = [Dog(), Cat()]

for animal in myAnimals {
    animal.makeSound()
}

// ✅ Ye hai runtime polymorphism — run hone par decide hota hai kaunsa behavior chalega.


/*
 ✅ Summary:
     •    Polymorphism = Ek method, alag-alag behavior (based on object type)
     •    Use override in subclasses
     •    Use parent class type to store different subclass objects
*/






// MARK: -------------------- Lesson 6: Abstraction in Swift (OOP) --------------------- \\

/*
   🔸 Theory (Simple & Clear):
 
   Abstraction ka matlab:  ( hota ha k siraf important details show karna, internal complexity chupa lena )
 
   Yni:
   . User ko siraf yeh pata ho k kiya karna ha.
   . Kaise ho raha ha yeh pata na ho.
 
  
   🔸 Real-Life Example:
                        Soochiyeh Ap Car chala rahe ho. Apko siraf gear, stearing, race, brake use karna pata hai,
                        
                        But Apko yeh nhi pata k engine kesay kaam kar raha fuel injection kaam kaise karte hain - Woh sab hidden hota ha.
                        
    Means Apko siraf interface diya gya ha, implementation hide kardi gai hai.
 
    
    🔸 Swift mein Abstraction kaise karte hain?
    
     1. Using Protocol -> Jo k interface yn architecture define kartay hein ap k object ka.
     2. Using Abstract Base Class -> Swift mein directly Abstract base class nhi hoti, leikin protocol + default implementation ka istemal hota hai.
  
*/


// 🔸 Swift Code Example (Using Protocol – Interface):

protocol Shape {
    func area() -> Double
}


// Class 1:
class Circle: Shape {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return 3.14 * radius * radius
    }
}


// Class 2:
class Rectangle: Shape {
    var height: Double
    var width: Double
    
    init(height: Double, width: Double) {
        self.height = height
        self.width = width
    }
    
    func area() -> Double {
      return width * height
    }
}


// 🔸 Usage:
let shapes: [Shape] = [
    Circle(radius: 5),
    Rectangle(height: 4, width: 10),
]

for shape in shapes {
    print("Area: \(shape.area())")
}


/*
 ✅ Summary:
     •    Abstraction means: Show only what is necessary
     •    Use protocols to define abstract interface
     •    Classes implement details behind the scenes
*/
