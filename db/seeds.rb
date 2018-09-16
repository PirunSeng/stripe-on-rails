plans =
  [
    { name: "Never Been Kisses", price: 5 },
    { name: "Can't Get Enough", price: 12 },
    { name: "Pure Bliss", price: 49 },
    { name: "I'm in Heaven", price: 99 }
  ]

plans.each do |plan|
  Plan.find_or_create_by(plan)
end
