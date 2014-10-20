require "spec_helper"
require "BankAccount"

describe BankAccount do
  describe "#check_balance" do
    it "check the deposit" do
   	  account1=BankAccount.new(5000)
      balance=account1.deposit(60000)
      expect(balance).to eq(65000)
    end

    it "check the withdraw" do
   	  account1=BankAccount.new(5000)
      balance=account1.withdraw(300)
      expect(balance).to eq(4700)
    end

    it "check the transaction" do
   	  account1=BankAccount.new(5000)
      account1.withdraw(300)
      account1.deposit(60000)
      account1.deposit(60000)
      count=account1.numberOfTransactions()
      expect(count).to eq(3)
    end

    it "check changed name" do
    	 account1=BankAccount.new(5000)
    	 new_name = account1.changeName("Blah")
    	 expect(new_name).to eq("Blah")
    end

    end
end