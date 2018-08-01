//
//  Basic.swift
//  Demo
//
//  Created by volive solutions on 01/08/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//


//: Playground - noun: a place where people can play
/*
import UIKit

var str = "Hello, playground"

class Vehicle
{
    var wheels:Int = 0
    var maxSpeed:Int = 0
    
    func drive()
    {
        print("This vehicle is driving!")
    }
    
}

class RaceCar: Vehicle
{
    var hasSpoiler = true
    
    override func drive()
    {
        print("VROOOOM!!!")
    }
}

class Bus: Vehicle
{
    var seats:Int = 0
    var gear:Int = 1
    
    func shiftGears()
    {
        gear += 1
        
    }
}

let ferrari = RaceCar()
ferrari.wheels = 4
ferrari.hasSpoiler = false
ferrari.drive()

let bicycle = Vehicle()
bicycle.wheels = 2
bicycle.drive()

let greyhound = Bus()
greyhound.wheels = 8
greyhound.shiftGears()
greyhound.shiftGears()
print("Gear: \(greyhound.gear)")

/////*****************Variables and Constants ************** ////////////////



/// On the first line, you declare a variable named age of type Int, and then you assign the value 42 to it.
///On the second line, you print out the value of the variable age with the print() function.
//Declaration is like saying: “Swift, pay attention! I’m announcing a new variable!”
//Initialization is like saying: “Swift, that variable has an initial value of 42.”
var age:Int = 42
print(age)

//The syntax for declaring and initializing, as shown in the previous example, is as follows:
//
//var is the keyword that indicates a new variable declaration
//age is the name of the variable
//: separates the variable name and type
//Int is the type of the variable
//= is used to assign a value to the variable
//42 is the value of the variable



/// n Swift you can create variables with var and constants with let. The difference between a variable and a constant is that a variable can be changed once it’s set, and a constant cannot
let name:String = "Bob"
print(name)

//let name1:String = "Bob"
//name1 = "Alice"
//print(name1)

var score = 77
print(type(of: score))



class Vehicles {
    var wheels:Int = 4
    var name:String?
}

let cars = Vehicles()
print(cars.wheels)
print(cars.name ?? "nil")

cars.name = "Maserati"
print(cars.name ?? "nil")



/// Guard Let First, you can combine optional binding and the guard statement. Like this:
///
/// - Parameters:
///   - username: you’re using guard together with let. So when either username or password is nil, the guard is invoked and the function returns early.
///   - password: you’re using guard together with let. So when either username or password is nil, the guard is invoked and the function returns early.
func authenticate(username: String?, password:String?)
{
    guard let username = username, let password = password else {
        return
    }
    
    print("username = \(username), password = \(password)")
}

authenticate(username: "Bob", password: "1234")


//1 The For Loop in Swift
//2 How To Loop Over Collections With For-In
//3 How To Loop Over Ranges With For-In
//4How To Loop With While And Repeat-While

//A for loop in Swift always has the for and in keywords. The for loop then takes a sequence, items in the example above, and loops over the sequence one-by-one

let names = ["Arthur", "Zaphod", "Trillian", "Ford", "Marvin"]

for name in names {
    print(name)
}
//closed range operator ... to create a range that goes from 1 to 5
for n in 1...5 {
    print(n)
}

let numbers = [1, 2, 3, 4, 5, 6]
var sum = 0

for i in numbers {
    sum += i
}

print(sum)


/// create a function that returns the sum of any array of integer numbers
///
/// - Parameter numbers: integers
/// - Returns: return also integer

func sum(_ numbers:[Int]) -> Int
{
    var sum = 0
    
    for n in numbers {
        sum += n
    }
    
    return sum
}

let result = sum([23, 11, 9, 3, 24, 77])
print(result)


//let buttons = [loginButton, signupButton, facebookButton]
//
//for button in buttons {
//    button.backgroundColor = UIColor.red
//    button.layer.cornerRadius = 5.0
//}


//while(condition == true) {
//    // Repeat this
//}
//repeat {
//    // Do this
//} while(condition == true)




// *********************** Function ***************** //


/// Function declaration
///
/// - Parameters:
///   - piece:passing string parameter
///   - steps:steps string parameter

func moveForward(piece: String, steps: Int)
{
    print("Moving the \(piece) piece \(steps) steps forward...")
}
moveForward(piece: "Queen", steps: 3)
 */
 */
