require "active_support/inflector"

When(/^the client requests GET (.*)$/) do |path|
  get(path)
end

When(/^the client requests a list of (.*?)s?$/) do |type|
  get("/#{type.pluralize.downcase.tr(' ', '-')}")
end

Then(/^the response should be JSON:$/) do |json|
  expect(MultiJson.load(last_response.body)).to eq(MultiJson.load(json))
end

Then(/^the response is a list containing (#{CAPTURE_INT}) (.*?)s?$/) do |count, type|
  data = MultiJson.load(last_response.body)
  validate_list(data, of: type, count: count)
end

Then(/(#{CAPTURE_INT}) (?:.*?) ha(?:s|ve) the following attributes:$/) do |count, table|
  expected_item = table.hashes.each_with_object({}) do |row, hash|
    name, value, type = row["attribute"], row["value"], row["type"]
    hash[name.tr(" ", "_").camelize(:lower)] = value.to_type(type.constantize)
  end
  data = MultiJson.load(last_response.body)
  matched_items = data.select { |item| item == expected_item }
  expect(matched_items.count).to eq(count)
end