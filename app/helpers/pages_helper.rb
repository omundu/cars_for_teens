module PagesHelper
  
  def display_car_info(car_information)

    car, year, suggested_price = car_information.first, car_information[1], car_information.last
    manufacturer, *model = car.split

    # content_tag :li, content_tag(:ul, car_details(car_information), class: "car")
  end

  def car_details(car_information)
    car_information.inject(content(:ul, nil, class: "manufacturer")) do |collection, car|
      collection << content_tag(:li, car)
    end
  end
  
  def car_information(cars)
    content_tag :ul do
      cars.collect {|car_detail| content_tag(:li, car_detail)}
    end
  end
  
end

# arr = ['a','b','c']
# content_tag :div do
#   arr.collect { |letter| content_tag(:scan, letter)
# end
 # <li> <%= car.join(" :: ") %> </li>
 # <% vehicle, year, price = car.first.split, car[1], car.last %>
 # <% manufacturer, *make = vehicle %>
 # <li> <%= manufacturer %>
 #   <ul>
 #     <li><%= make.join(" ") %></li>
 #     <li><%= year %></li>
 #     <li><%= price %></li>
 #   </ul>
 # </li>
 

