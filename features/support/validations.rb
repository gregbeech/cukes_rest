def validate_list(data, of: nil, count: nil)
  expect(data).to be_a_kind_of(Array)
  expect(data.count).to eq(count) unless count.nil?
  unless of.nil?
    validate_item = "validate_#{of.singularize.downcase.tr(' ', '_')}".to_sym
    data.each { |item| send(validate_item, item) }
  end
end

def validate_fruit(data)
  expect(data["name"]).to be_a_kind_of(String)
  expect(data["name"]).to_not be_empty
  expect(data["color"]).to be_a_kind_of(String)
  expect(data["color"]).to match(/^(green|purple|red|yellow)$/i)
end

def validate_cup_size(data)
  expect(data["name"]).to be_a_kind_of(String)
  expect(data["name"]).to_not be_empty
  expect(data["fluidOunces"]).to be_a_kind_of(Integer)
  expect(data["fluidOunces"]).to be >= 0
end