class BankAccount

    attr_accessor :status, :balance  
    attr_reader :name  

    def initialize(name, balance = 1000, status = "open")
        @name = name 
        @balance = balance 
        @status = status 
    end
    
    def close_account
        self.status = "closed"
    end 

    def deposit(amount)
        @balance += amount 
    end 

    def display_balance
        return "Your balance is $#{@balance}." 
    end 

    def valid?
        @status == "open" && @balance > 0
    end 

end
