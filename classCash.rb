class CashMgmt


attr_reader 
attr_writer 
attr_accessor :state, :bill, :amt


	def initialize(event)

		@state
		@event = event
		@bill
		@amt
		@cashCreditTransaction = []
		@cashDebitTransaction = []
		@cashTotal = 0 

	end

	def credit(bill, amt)
		@state = 'credit'
		@bill = bill
		@amt = amt.to_s
		trans = {bill => amt}
		# Not accounting fo time in dev
		@cashCreditTransaction.push(trans)
		@cashTotal += amt

		return
	end

	def debit(bill, amt)
		@state = 'debit'
		@bill = bill
		@amt = amt.to_s
		trans = {bill => amt}
		@cashDebitTransaction.push(trans)
		@cashTotal -= amt
		return
	end


	def verifyCash

		case bill

		when bill = 'billHundred'
		# Validation [$100 >= 100]
			#self.commitCash(bill, amt)
			
		when bill = 'billTwenty'
			#self.commitCash(bill, amt)
		else
			puts 'ERROR!!!!!!!!!!!'
		end
	end

	public 
	def commitCash (bill, amt)
	# Commit to DB 
		t = Time.now
		if self.state == 'credit'
			trans = {bill => amt}
			# Not accounting fo time in dev
			@cashCreditTransaction.push(trans)
			@cashTotal += amt
		else
			trans = {bill => amt}
			@cashDebitTransaction.push(trans)
			@cashTotal -= amt
		end
	end

	def inspect
		"Event= #{@event}\n" + 
		"Last State = #{@state}\n" +
		"Cash Credit Transactions: #{@cashCreditTransaction}\n" + 
		"Cash Debit Transactions: #{@cashDebitTransaction}\n" + 
		"Total Cash: #{@cashTotal}\n" + "\n"
	end

end

#-------------------------------------------------

# Field Variables
billHundred = 'billHundred'
billTwenty = 'billTwenty'
billFive = 'billFive'


# Instantaite Object 
a = CashMgmt.new('ticBooth')

a.credit(billHundred, 300)
a.credit(billTwenty, 160)
a.credit(billFive, 160)
a.debit(billHundred, 60)


puts a.inspect


b = CashMgmt.new('snackTent')

b.credit(billHundred, 500)
b.credit(billTwenty, 80)
a.credit(billFive, 160)
b.debit(billTwenty, 100)

puts b.inspect