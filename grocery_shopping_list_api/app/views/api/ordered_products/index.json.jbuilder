# rather than build HTML views, Jbuilder allows us to construct JSON views
json.ordered_products do @dates
  @dates.each do |date, ordered_products|
    json.set! date do
      h = Hash.new { |hash, key| hash[key] = Hash.new(0) }
      ordered_products.each do |ordered_product|
        h[ordered_product.product_id]["name"] = ordered_product.product.name
        h[ordered_product.product_id]["sold"] += ordered_product.number_purchased
      end
      json.product_id h
    end
  end
end

# json.set! :author do
#   json.set! :name, 'David'
# end

# => {"author": { "name": "David" }}
# For more info on jbuilder syntax: https://github.com/rails/jbuilder
