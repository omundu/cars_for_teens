require 'test_helper'

class PagesHelperTest < ActionView::TestCase
  
  test "display car" do
    skip("awaiting implementation")
    
    car = [["Mitsubishi", "Lancer Evolution VI TME"], "1999", "$50,000"]
    result = "<ul><li>Lancer Evolution VI TME</li><li>1999</li><li>$50,000</li></ul>"
    
    asset_equal display_car_info(car), result
  end
  
  test "clean display" do
    skip(" awaiting test")
    
    car_array = [
      ["BMW 3-series sedan", "2006 and later", "$9,300"],
      ["Saturn Aura", "2009", "$8,800"],
      ["Acura TL", "2004 and later", "$7,900"],
      ["Volvo S40", "2007 and later", "$7,700"],
      ["Mercedes-Benz C-Class sedan", "2005-08", "$6,900"],
      ["Suzuki Kizashi", "2010 and later", "$6,600"],
      ["Mitsubishi Lancer Evolution VI TME", "1999", "$50,000"]
    ]
    result_array = [
      [["BMW", "3-series sedan"], "2006 and later", "$9,300"],
      [["Saturn", "Aura"], "2009", "$8,800"],
      [["Acura", "TL"], "2004 and later", "$7,900"],
      [["Volvo", "S40"], "2007 and later", "$7,700"],
      [["Mercedes-Benz", "C-Class sedan"], "2005-08", "$6,900"],
      [["Suzuki", "Kizashi"], "2010 and later", "$6,600"],
      [["Mitsubishi", "Lancer Evolution VI TME"], "1999", "$50,000"]
    ]
  end
  
end
