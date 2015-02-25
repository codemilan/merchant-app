class Product < ActiveRecord::Base
	has_many :order_items

	validates_numericality_of :price
	validates_numericality_of :stock, if: Proc.new { |p| (p.stock.is_a? Integer and p.stock >= 0) ? true : false }

	def price=(input)
		input.delete!("$")
		super
	end
end
