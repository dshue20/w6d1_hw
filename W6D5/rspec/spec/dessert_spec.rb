require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) { Dessert.new("brownie",6,"Derek") } 
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(6)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie","a","derek")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("chocolate")
      expect(dessert.ingredients).to include("chocolate")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      dessert.add_ingredient("chocolate")
      dessert.add_ingredient("flour")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("eggs")
      original_ingredients = dessert.ingredients.dup
      dessert.mix!
      expect(dessert.ingredients).to_not eq(original_ingredients)
      expect(dessert.ingredients.sort).to eq(original_ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      amount = dessert.quantity
      dessert.eat(1)
      expect(dessert.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(20) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include("Derek")
    end
  end

  describe "#make_more" do
    subject(:dessert) { Dessert.new("cookie",12,chef) }
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
