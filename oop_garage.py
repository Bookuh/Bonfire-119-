class ParkingGarage:
    def __init__(self, max_tickets=100, max_spaces=50):
        self.tickets = [num for num in range(1, max_tickets+1)]
        self.parking_spaces = [num for num in range(1, max_spaces+1)]
        self.current_ticket = {}

    def take_ticket(self):
        ticket = self.tickets.pop(0)
        space = self.parking_spaces.pop(0)
        self.current_ticket[ticket] = {"space": space, "paid": False}
        print(f"Your ticket number is {ticket}, please park in space {space}.")
        
    def pay_for_parking(self):
        tick_num = int(input("Enter your ticket number: "))
        if tick_num not in self.current_ticket:
            print("Invalid-Please enter a valid ticket number.")
            return
        
        ticket = self.current_ticket[tick_num]
        if ticket["paid"]:
            print("Ticket paid.")
            return
        
        payment = input("Enter payment: ")
        if payment:
            ticket["paid"] = True
            print("Ticket paid, You have 15 minutes to leave.")
        else:
            print("Payment required.")
        
    def leave_garage(self):
        tick_num = int(input("Please enter your ticket number: "))
        if tick_num not in self.current_ticket:
            print("Invalid-Please enter a valid ticket number.")
            return
        
        ticket = self.current_ticket[tick_num]
        if not ticket["paid"]:
            payment = input("Payment required, please enter payment: ")
            if payment:
                ticket["paid"] = True
            else:
                print("Payment required.")
                return
        
        print("Thank you!")
        self.parking_spaces.append(ticket["space"])
        self.tickets.append(tick_num)
        del self.current_ticket[tick_num]

