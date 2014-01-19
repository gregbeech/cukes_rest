Given(/^the system knows about the following cup sizes:$/) do |cup_sizes|
  FruitApp.cup_sizes = cup_sizes.hashes.map do |hash|
    hash.each_with_object({}) do |(k, v), h|
      h[k.tr(" ", "_").camelize(:lower)] = v =~ /\d+/ ? v.to_i : v
    end
  end
end