//: Playground - noun: a place where people can play

import UIKit


class Person
{
    var firstName : String?
    var lastName : String?
}

var person : Person? = Person()
person?.firstName = "Andre"


if let somePerson = person,
    someFirstName = somePerson.firstName
{
    print("1) success")
}
else
{
    print("1) failure")
}


if let somePerson = person,
    someFirstName = somePerson.firstName,
    someLastName = somePerson.lastName
{
    print("2) success")
}
else
{
    print("2) failure")
}
