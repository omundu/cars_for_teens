module PagesHelper
  
  def display_car_info(car_information)

    car, year, suggested_price = car_information.first, car_information[1], car_information.last
    manufacturer, *model = car.split
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
  
  def car_id(car_value)
    car_value > 10000 ? "gooder" : "good"
  end
  
end
 

