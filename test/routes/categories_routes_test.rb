require "test_helper"

class CategoriesRoutesTest < ActionController::TestCase
  
  test "should resolve the categories url" do
    assert_routing 'categories', {controller: "categories", action: "index"}
  end
  
  test "should resolve the category url" do
    assert_routing 'categories/performance', {controller: "categories", action: "show", category: "performance"}
  end
  
  test "should resolve the category model url" do
    assert_routing 'categories/performance/mitsubishi_lancer_evolution', {controller: "categories", action: "model", category: "performance", model: "mitsubishi_lancer_evolution"}
  end
 
  test "should resolve the category year url" do
    assert_routing 'categories/performance/mitsubishi_lancer_evolution/2010', {controller: "categories", action: "year", category: "performance", model: "mitsubishi_lancer_evolution", year: "2010"}
  end
end