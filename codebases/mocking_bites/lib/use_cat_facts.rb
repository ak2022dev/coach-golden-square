require_relative 'cat_facts'

cat_facts = CatFacts.new(Net::HTTP)

puts cat_facts.provide
