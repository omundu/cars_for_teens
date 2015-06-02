require 'test_helper'

class CarExtractorTest < ActiveSupport::TestCase
  test "get car array" do
    html_doc = Nokogiri::HTML("<html><body><table><tr><td>one</td><td>1998</td></tr><tr><td>three</td><td>1999-00</td></tr><tr><td>five</td><td>2001 and later</td></tr></table></body></html>")
    expected_result = [
      Car.new(manufacturer: "one", years: [1998], suggested_price: 0, model: ""),
      Car.new(manufacturer: "three", years: [1999, 2000], suggested_price: 0, model: ""),
      Car.new(manufacturer: "five", years: [2001, 2002, 2014], suggested_price: 0, model: "")
    ]

    assert_equal expected_result.map(&:to_s), CarExtractor.new.get_car_array(html_doc).map(&:to_s)
  end
  
  test "remove empty arrays" do
    array1 = [[], [1, 2, 3], [4, 5, 6], [7, 8, 9]]
    array2 = [[1, 2, 3], [], [4, 5, 6], [7, 8, 9]]
    array3 = [[1, 2, 3], [4, 5, 6], [], [7, 8, 9]]
    array4 = [[1, 2, 3], [4, 5, 6], [7, 8, 9], []]
    array5 = [[], [1, 2, 3], [], [4, 5, 6], [], [7, 8, 9], []]
    array6 = [[], [], [], [1, 2, 3], [], [], [], [4, 5, 6], [], [], [], [7, 8, 9], [], [], []]
    array7 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

    [array1, array2, array3, array4, array5, array6, array7].each do |test_array|
      assert_equal [[1, 2, 3], [4, 5, 6], [7, 8, 9]], CarExtractor.new.remove_empty_arrays(test_array)
    end
  end

  test "handle empty arrays" do
    array1 = [[]]
    array2 = [[], [], []]
    array3 = []

    [array1, array2, array3].each do |test_array|
      assert_equal [], CarExtractor.new.remove_empty_arrays(test_array)
    end
  end

  test "select by elements" do
    html_doc = Nokogiri::HTML(
      "<html>
        <body>
          <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
            <li>6</li>
          </ul>
        </body>
      </html>"
    )
    extracted = CarExtractor.new.select_by_element(html_doc, "li").map(&:content)

    assert_equal ["1", "2", "3", "4", "5", "6"], extracted
  end

  test "select data cells" do
    html_doc = Nokogiri::HTML(
      "<html>
        <body>
          <table>
            <tr>
              <td>one</td><td>two</td>
            </tr>
            <tr>
              <td>three</td><td>four</td>
            </tr>
            <tr>
              <td>five</td><td>six</td>
            </tr>
          </table>
        </body>
      </html>"
    )
    expected_result = [
      Nokogiri::HTML("<tr><td>one</td><td>two</td></tr>").at_css('tr').children,
      Nokogiri::HTML("<tr><td>three</td><td>four</td></tr>").at_css('tr').children,
      Nokogiri::HTML("<tr><td>five</td><td>six</td></tr>").at_css('tr').children
    ]
    received_result = CarExtractor.new.select_data_cells(html_doc)

    assert_equal expected_result.map(&:text), received_result.map(&:text)
  end

  test "extract car information" do
    car =  Nokogiri::HTML("<tr><td>vw ion</td><td>2011</td></tr>").at_css('tr').css('td')
    expected_car = Car.new({manufacturer: "vw", years: [2011], suggested_price: 0, model: "ion"})
    built_car = CarExtractor.new.extract_car_information([car]).first

    assert_equal expected_car.to_s, built_car.to_s
  end

  test "construct car information" do
    row0 = Nokogiri::HTML("<tr><td>ford puma</td><td>2006-08</td></tr>").at_css('tr').css('td')
    row1 = Nokogiri::HTML("<tr><td>fiat pogo</td><td>2009</td></tr>").at_css('tr').css('td')
    row2 = Nokogiri::HTML("<tr><td>kia rogue</td><td>2010 and later</td></tr>").at_css('tr').css('td')
    row3 = Nokogiri::HTML("<tr><td>bmw X-5 M</td><td>2005-08; built after October 2004</td></tr>").at_css('tr').css('td')

    car0 = {
      :manufacturer => "ford",
      :model => "puma",
      :years => [2006, 2007, 2008],
      :suggested_price => 2006,
      :extra_information => nil
    }
    car1 = {
      :manufacturer => "fiat",
      :model => "pogo",
      :years => [2009],
      :suggested_price => 2009,
      :extra_information => nil
    }
    car2 = {
      :manufacturer => "kia",
      :model => "rogue",
      :years => [2010, 2011, 2012, 2013, 2014],
      :suggested_price => 2010,
      :extra_information => nil
    }
    car3 = {
      :manufacturer => "bmw",
      :model => "X-5 M",
      :years => [2005, 2006, 2007, 2008],
      :suggested_price => 2005,
      :extra_information => " built after October 2004"
    }

    assert_equal car0, CarExtractor.new.construct_car_information(row0)
    assert_equal car1, CarExtractor.new.construct_car_information(row1)
    assert_equal car2, CarExtractor.new.construct_car_information(row2)
    assert_equal car3, CarExtractor.new.construct_car_information(row3)
  end

  test "extract years" do
    garage = CarExtractor.new
    y1 = "2009"
    y2 = "2010-11"
    y3 = "2010 and later"

    assert_equal  [2009], garage.extract_years(y1)
    assert_equal  [2010, 2011], garage.extract_years(y2)
    assert_equal  [2010, 2011, 2012, 2013, 2014], garage.extract_years(y3)
  end
end
