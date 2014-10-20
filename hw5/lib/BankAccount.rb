class BankAccount
	
	def initialize(money)
		@count=0
		@balance=money
		@accountNumber=1
		@name="A"
	end 
	def withdraw(numbers)
		#puts "#{(@balance-numbers)}"
		@balance-=numbers
		@count+=1
		return @balance;
	end
	def deposit(numbers)
		#puts "#{(@balance+numbers)}"
		@balance+=numbers
		@count+=1
		return @balance;
		
	end
	def numberOfTransactions()
		return @count;
	end

	def changeName(newName)

		@name=newName
		#puts "#{(@name)}"
		return @name
	end


end