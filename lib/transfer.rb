class Transfer

  attr_accessor :status 
  attr_reader :sender, :receiver, :amount 
  
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver 
    @status = status 
    @amount = amount 
  end 

  def execute_transaction
    
    if valid? && @status != "complete" && @status != "rejected" && @status != "reversed"
      @sender.balance -= amount 
      @receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount 
      @receiver.balance -= @amount 
      self.status = "reversed"
    end 
  end 

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > @amount 
  end 

end
