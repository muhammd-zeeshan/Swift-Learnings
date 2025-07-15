import Foundation

var greeting = "Hello, playground"


// MARK:       ---- Stack (memory) ----

/*
   In Swift Value types(like, Int, String, Bool, Double, Struct, enums, Set, Array, etc..) and loacal variables(that varaible are declared in functions) are stored in stack memoery. its fast and automatically allocated and deallocated when the function's scope ends.
   
   
 in easy way:
     Swif mein memories divided hein "Stack" or "Heap" mein. Stack memory bohat fast, small or organized hoti hai. Ismay value types or local variables store hotay hein, yeh automatically cleaned ho jati ha, jab koi function apna kaam complete kar le.
   
*/

// ✅ Example 1: Value Type in Stack
struct UserStruct {
    var name: String
}

var user1 = UserStruct(name: "Shahrukh")
var user2 = user1
user2.name = "Salman"

print(user1.name)  // Shahrukh
print(user2.name) // Salman

// Explanation:

// . user2 = user1 (means user1 ki user2 copy ban gai in stack memory)
// • user1 aur user2 independent hain.
// • Har variable apni memory use kar raha hai → Stack.



// MARK:       ---- Heap (Memory) ----

/*
   Heap is slow, large and Manual cleanup memory system, In heap Reference types are stored like "classes and closure". Heap is persists until all reference to the object are gone, In swift heap memory is managed by Automatic reference counting (ARC).
*/


// Example 2: Reference Type in Heap

class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var class1 = User(name: "Ali")
var class2 = class1
class2.name = "Raza"

print(class1.name)  
print(class2.name)  


// class2 ne class1 ki copy nhi banai Q k dono heap memory mein store hoye or class object k paas single thread hota ha jis k waja sa aik instance mein kiya gya change dono ko effect karta ha.




// MARK:       ---- Problems and Examples ----

struct Profile {
    var name: String
}

//  ✅ Ye Profile ek struct hai → value type → normal behaviour: copy hoti hai.

class Account {
    var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
}
// ✅ Account ek class hai → reference type → agar tum isay assign karte ho kisi aur variable ko, to dono same object ko refer karte hain (heap memory).



var profile1 = Profile(name: "Shahrukh")   // yeh profile1 ek simple struct with name = "Sharukh"



var account1 = Account(profile: profile1)  // account1 bana ek class object jisme profile1 ki copy gayi (kyunki Profile is a struct/value type)  Is waqt: account1.profile.name = "Shahrukh"



var account2 = account1  // 😯 Ab account2 ne account1 ko copy nahi kiya — because Account is a class (reference type) — dono same object ko refer kar rahe hain.
// •    Agar tum account2 mein kuch bhi change karo, wo account1 mein bhi reflect hoga.



account1.profile.name = "Salman"   // 👀 Yeh line confusing lagti hai — kyun?
/*
    Q k Profile to ek struct ha uski copy honi chahyeh thi. lekin...
 
    ➡️ Important Swift Behavior:
    Even though Profile is a struct(value type), its a stored as a property inside a class(reference type).
 
    Swift kiya karti ha?
    
    1. account2.profile ki value copy karta hai (because its a value type).
    2. Phir us copy ka name change karta hai.
    3. Lekin wo copy kisi jagah assign nhi hoti, is liyeh change discard ho jata hai.
*/

print(account2.profile.name)
