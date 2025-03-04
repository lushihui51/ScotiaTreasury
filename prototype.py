from typing import Optional

class Officer():

    def __init__(self, ID: int, first_name: str, last_name: str):
        self.ID = ID
        self.first_name = first_name
        self.last_name = last_name


class Balance(): #JSON

    def __init__(self, ones: int, fives: int, tens: int, twenties: int, fifties: int, hundreds: int, officer: Officer):
        self.ones = ones
        self.fives = fives
        self.tens = tens
        self.twenties = twenties
        self.fifties = fifties
        self.hundreds = hundreds
        self.officer = officer


class Posting(): #JSON

    def __init__(self, ones: int, fives: int, tens: int, twenties: int, fifties: int, hundreds: int, officer: Officer):
        self.ones = ones
        self.fives = fives
        self.tens = tens
        self.twenties = twenties
        self.fifties = fifties
        self.hundreds = hundreds
        self.officer = officer

class Treasury():
    
    def __init__(self, balance: Optional[Balance]):
        if balance:
            self.cur_bal = balance
        else:
            self.cur_bal = Balance(0, 0, 0, 0, 0, 0, Officer(9233393, 'Jaden', 'Lu'))
    
    def post(self, posting: Posting): #asynchornus 
        self.cur_bal.ones, self.cur_bal.fives, self.cur_bal.tens, self.cur_bal.twenties, self.cur_bal.fifties, self.cur_bal.hundreds += posting.ones, posting.fives, posting.tens, posting.twenties, posting.fifties, posting.hundreds
    


        
