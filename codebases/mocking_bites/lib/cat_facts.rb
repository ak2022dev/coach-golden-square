require 'json'
require 'net/http'

class CatFacts
  # Need an intialiser into which we inject a dependency and then can unit-test using a double
  def initialize(fact_getter)
    @fact_getter = fact_getter
  end

  def provide
    return "Cat fact: #{get_cat_fact["fact"]}"
  end

  private

  def get_cat_fact
    text_response = @fact_getter.get(URI("https://catfact.ninja/fact"))
    return JSON.parse(text_response)
  end
end
