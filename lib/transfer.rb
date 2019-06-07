require 'pry'

class Transfer

	attr_accessor :sender, :receiver, :amount, :status

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"
	end

	def valid?
		if sender.valid? && receiver.valid?
			true
		else
			false
		end
	end

	def execute_transaction
		
		if @sender.balance < @amount
			"Transaction rejected. Please check your account balance."
		elsif @status == "complete"
			nil
		elsif !valid?
			@status = "rejected"
			"Transaction rejected. Please check your account balance."
			binding.pry
		else
			@sender.deposit(-@amount)
			@receiver.deposit(@amount)
			@status = "complete"
		end

			# it "rejects a transfer if the sender doesn't have a valid account" do
		    #    expect(bad_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
   			#    expect(bad_transfer.status).to eq("rejected")
	end

end
