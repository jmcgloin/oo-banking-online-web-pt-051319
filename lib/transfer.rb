require 'pry'

class Transfer

	attr_reader :sender, :receiver, :amount, :status

	def initialize(sender, receiver , amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = 'pending'
	end

	def valid?
		(@sender.valid? && @receiver.valid?)
	end

	def execute_transaction
		if !self.valid? || @sender.balance < @amount
			@status = 'rejected'
			"Transaction rejected. Please check your account balance."
		elsif @status == 'pending'
			@sender.deposit(-1 * @amount)
			@receiver.deposit(@amount)
			@status = 'complete'
		end
	end

	def reverse_transfer
		if @status == 'complete'
			@sender.deposit(@amount)
			@receiver.deposit(-1 * @amount)
			@status = 'reversed'
		end
	end

end
