extends Node
class_name BankAccount

export var current_money: int = 0

func add_money(amount: int) -> bool:
    if amount < 0:
        return false
    
    current_money += amount
    return true

func withdraw(amount: int) -> bool:
    if amount > current_money:
        #! Player loses HERE
        return false
    
    current_money -= amount
    return true
