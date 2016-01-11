# delete previous records
Manufacturer.delete_all
Brand.delete_all
Modification.delete_all


#create new records

manuf_names = [
    'Acura',
    'Alfa Romeo',
    'Aston Martin',
    'Audi'
]

brands = [
    [0, ["MDX II", "http://img.exist.ru/img.jpg?Key=11921&Size=150x100&MethodType=5"]],
    [0, ["RDX", "http://img.exist.ru/img.jpg?Key=7385&Size=150x100&MethodType=5"]],
    [1, ["147", "http://img.exist.ru/img.jpg?Key=4735&Size=150x100&MethodType=5"]],
    [2, ["Cygnet", "http://img.exist.ru/img.jpg?Key=9781&Size=150x100&MethodType=5"]],
    [3, ["A1", "http://img.exist.ru/img.jpg?Key=9251&Size=150x100&MethodType=5"]]
]

modifications =[
    [0, ["3.7 AWD", "J37A1", 3.7, 300, 2006, 2013]]
]

manuf_names.each do |name|
  Manufacturer.create(name: name)
end

brands.each do |brand|
  manufact = Manufacturer.find_by_name(manuf_names[brand[0]])
  Brand.create(name: brand[1][0], image_url: brand[1][1], manufacturer: manufact)
end

modifications.each do |mod|
  brand = Brand.find_by(name: brands[mod[0]][1][0])
  p brand.name
  modif = Modification.create(brand: brand, name: mod[1][0], model_motor: mod[1][1], volume_motor: mod[1][2], power: mod[1][3], start_production: mod[1][4], stop_production: mod[1][5])
  p modif
end







