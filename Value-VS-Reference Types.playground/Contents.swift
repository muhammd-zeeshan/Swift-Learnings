import UIKit
import Foundation

var greeting = "Hello, playground"


//  Swift mein jb hum data ko represent karte hain means ko number yn string wgera store karte hain, to Swift ka main treeqa hai: Value types ka use.

// Example of value type:

var x = 1
var y = x
x = 20
print(x, y) // 20, 1

// Jab mein x ki value ko change karta ho to y ki value waisi ki waisi rehti hai-1,
// Q k Swift k value typse copy bana lete hain, yni har variable apni alag sa value rakhta ha, kisi or k sath data share nhi karta.

// Swift ke value types ka matlab hai: copy hoti hai, link nahi hoti.

/*
 📌 Key Point:
     •    Value types:        Har variable ki apni copy hoti hai.
 
     •    No shared state:    Agar tum ek variable change karo, dusra variable par asar nahi hoga.
 
     •    No identity:        Do values agar barabar hain, to wo ek hi jaisi treat hongi — jaise 5 == 5, koi farq nahi kis variable mein hain.
 
     •    let vs var:         let = fix (read-only), var = changeable (mutable)

*/


// MARK: swift value types, Kia Hai?
// Swift mein value types wo hein jinka har instance copy hota ha,  Means agar hum aik value type ka  variable kisi dosray ko assign karaingay to wo uski copy bana leta ha, reference nhi. ✅ Change aik jagah hoga, doosri jagah nahi.


// Example:
var a = 10
var b = a
a = 20

// Yahan b ne a ki copy li ha, isi liyeh jab mainay a ki value change ki to b pr koi effect nhi huwa.




// MARK: 🏗 Structs as Value Types

struct User {
    var name: String
}

var user1 = User(name: "Zeeshan")
var user2  = user1
user1.name = "Usman"

print(user1.name)
print(user2.name)

// Yhn dono user alag hogye hain - Kuyn?
// Q k structures are value types, so user2 ne user1 ki aik copy apnay paas store ki isi liyeh jb dubara user1 ko change kiya gya to iska effect user2 pr nhi huwa.




// MARK:    ------ Reference Type ------

// Swift mein refernce type wo hotay hain jahan koi variable kisi value ki copy nhi banata, balkay usi original value ko point karta ha (refer karta hai).

/*
  ✅ Jab ek reference type ka variable kisi dosray variable ko assign kiya jata hai - to dono ek hi cheez ko refer karte hain.
     yni agar aik ko change kareingay to dosra b change ho jayega.
*/


// 🏗 Swift mein Reference Type kya hai?

/// class Swift ka main Reference type hai.


// Example
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var person1 = Person(name: "Zeeshan")
var person2  = person1
person2.name = "Usman"

print(person1.name)
print(person2.name)

// Yahan person1 or person2 ek hi object ko refer kar rahay hain, jab person2 ki name property ko change kiya to person1 bhi change hogya kyun? Beacuse class are reference type in swift



// 🔍 Identity Check in Reference Types:  Swift mein tum reference types ki identity check kar saktay ho:

if person1 === person2 {
    print("Same object")
}

// Yeh === sirf class instance k liyeh hota hai - yaani yeh check karta ha k dono variables aik hi object ko point kar rahay hain yn nhi.




// MARK: ⚖️ Value Type vs Reference Type – Easy Comparison

/*
 
 Feature                     Value Type (struct)                       Reference Type (class)
 
 Assignment                    Copy hoti hai                           Reference (link) hoti hai
 
 Identity                       Nahin hoti                             Hoti hai (=== se check karte hain)
 
 Memory                           Stack                                 Heap
 
 Performance                Fast (choti data ke liye)                   Useful for large shared objects
 
 Mutation                    Safe (no side effects)                     Shared — needs care

*/
