module ManufacturerHelper
  
  WIKIPEDIA_NAMES = {
    "Saab" => "Saab_Automobile",
    "Lincoln" => "Lincoln_Motor_Company",
    "Buick" => "Buick",
    "Ford" => "Ford_Motor_Company",
    "Volvo" => "Volvo_Cars",  
    "Toyota" => "Toyota",
    "Mercedes-Benz" => "Mercedes-Benz",
    "Honda" => "Honda",
    "Audi" => "Audi",
    "Subaru" => "Subaru",
    "Kia" => "Kia_Motors",
    "Hyundai" => "Hyundai_Motor_Company", 
    "Dodge" => "Dodge",
    "Volkswagen" => "Volkswagen_Group",
    "Chevrolet" => "Chevrolet",
    "Chrysler" => "Chrysler",
    "Mercury" => "Mercury_(automobile)",
    "Mitsubishi" => "Mitsubishi_Motors",
    "GMC" => "GMC_(automobile)",
    "Infiniti" => "Infiniti" ,
    "Acura" => "Acura",
    "BMW" => "BMW",
    "Mazda" => "Mazda",
    "Saturn" => "Saturn_Corporation",
    "Suzuki" => "Suzuki",
    "Nissan" => "Nissan_Motor_Company"
  }
  
  def get_manufacturer_summary
    manufacturer = params[:manufacturer]
    
    data_url = "http://dbpedia.org/data/#{WIKIPEDIA_NAMES[manufacturer]}.json"
    resource_url = "http://dbpedia.org/resource/#{WIKIPEDIA_NAMES[manufacturer]}"
    
    get_wikipedia_summary({data_url: data_url, resource_url: resource_url})
  end

end
