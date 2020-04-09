require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Pierre") }
  let(:tiramisu) { Dessert.new("tiramisu", 20, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(tiramisu.type).to eq("tiramisu")
    end

    it "sets a quantity" do
      expect(tiramisu.quantity).to eq(20)
    end

    it "starts ingredients as an empty array" do
      expect(tiramisu.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      tiramisu.add_ingredient("chocolate")
      expect(tiramisu.ingredients).to include("chocolate")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["flour", "butter", "sugar", "milk", "eggs"]

      ingredients.each do |ingredient|
        tiramisu.add_ingredient(ingredient)
      end

      expect(tiramisu.ingredients).to eq(ingredients)
      tiramisu.mix!
      expect(tiramisu.ingredients).not_to eq(ingredients)
      expect(tiramisu.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      tiramisu.eat(20)
      expect(tiramisu.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { tiramisu.eat(120)}.to raise_error("you already ate them all!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Pierre the Great Baker")
      expect(tiramisu.serve).to eq("Chef Pierre the Great Baker has made 20 tiramisus!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(tiramisu)
      tiramisu.make_more
    end
  end
end
