# 🐍 Module 06 — Advanced Python: Object-Oriented Programming

## Overview

This module introduces object-oriented programming in Python from first principles. It moves from the basic vocabulary of classes, objects, attributes and methods through initialization, class and static methods, and the four pillars of encapsulation, abstraction, inheritance and polymorphism. It finishes with the mechanics that make advanced Python feel natural: `super()`, object introspection, dunder methods, subclassing built-ins, multiple inheritance and method resolution order. Each lesson pairs concise notes with a runnable, dependency-free practice script.

## Lessons

| Lesson | Topic | Status |
| :--- | :--- | :---: |
| **[01 - What Is OOP?](./01-What_Is_OOP/README.md)** | Objects, classes, instances, and the OOP mindset | ⬜ |
| **[02 - What is OOP? Part 2](./02-What_Is_OOP_Part_2/README.md)** | Modeling domains, the four pillars, shared behavior vs shared state | ⬜ |
| **[03 - Creating Our Own Objects](./03-Creating_Our_Own_Objects/README.md)** | class syntax, instantiation, identity, and the instance namespace | ⬜ |
| **[04 - Attributes and Methods](./04-Attributes_and_Methods/README.md)** | Instance attributes, methods and self, class attributes and shadowing | ⬜ |
| **[05 - __init__](./05-__init__/README.md)** | Automatic initialization, defaults, validation, __init__ vs __new__ | ⬜ |
| **[06 - @classmethod and @staticmethod](./06-classmethod_and_staticmethod/README.md)** | @classmethod, cls, alternative constructors, @staticmethod, utilities | ⬜ |
| **[07 - Reviewing What We Know So Far](./07-Reviewing_What_We_Know_So_Far/README.md)** | Consolidated review of classes, instances, state and method kinds | ⬜ |
| **[08 - Developer Fundamentals V](./08-Developer_Fundamentals_V/README.md)** | Designing classes: responsibility, cohesion, small public interface | ⬜ |
| **[09 - Encapsulation](./09-Encapsulation/README.md)** | Bundling state and behavior, properties, invariants, public interface | ⬜ |
| **[10 - Abstraction](./10-Abstraction/README.md)** | Abstraction with abc.ABC, @abstractmethod, and contract enforcement | ⬜ |
| **[11 - Private vs Public Variables](./11-Private_vs_Public_Variables/README.md)** | Public, _protected, __mangled names, reserved dunder names | ⬜ |
| **[12 - Inheritance](./12-Inheritance/README.md)** | Single inheritance, overriding, is-a relationships, isinstance | ⬜ |
| **[13 - Inheritance 2](./13-Inheritance_2/README.md)** | Attribute lookup up the hierarchy, extending methods, parent init | ⬜ |
| **[14 - Polymorphism](./14-Polymorphism/README.md)** | Duck typing, one interface/many implementations, operator dispatch | ⬜ |
| **[15 - super()](./15-super/README.md)** | super() as MRO delegation, cooperative initialization | ⬜ |
| **[16 - Object Introspection](./16-Object_Introspection/README.md)** | Introspection: type, dir, vars, __dict__, inspect, __mro__ | ⬜ |
| **[17 - Dunder Methods](./17-Dunder_Methods/README.md)** | Dunder protocols: repr/str, len, getitem, iter, eq, contains, call | ⬜ |
| **[18 - Exercise - Extending List](./18-Exercise_Extending_List/README.md)** | Exercise: subclassing list, overriding append, other mutation paths | ⬜ |
| **[19 - Multiple Inheritance](./19-Multiple_Inheritance/README.md)** | Multiple bases, mixins, diamond problem, cooperative super() | ⬜ |
| **[20 - MRO - Method Resolution Order](./20-MRO_Method_Resolution_Order/README.md)** | C3 linearization, reading __mro__, super() and inconsistent MRO | ⬜ |
| **[Quiz — Object-Oriented Programming](./quiz.md)** | Self-assessment covering classes, inheritance, dunders, MRO... | ⬜ |

## 🎯 Module Objective

Build the ability to design and read idiomatic object-oriented Python: model a problem as cooperating objects, protect state with a clear public interface, reuse behavior through inheritance and mixins, and understand exactly which implementation Python calls when several are available. By the end, you should be able to implement small class hierarchies confidently, use dunder methods to make custom types feel built-in, and debug attribute lookup with introspection and MRO knowledge.

## 🎓 Course Video

`~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/`
