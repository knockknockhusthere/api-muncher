class Recipe
  attr_reader :label, :image, :url, :uri, :ingredientlines, :totalnutrients

  def initialize(label: recipe_label, image: recipe_image, url: recipe_url, uri: recipe_uri, ingredientlines: recipe_ingredientlines, totalnutrients: recipe_totalnutrients)
    #note that we use lazy evaluation to our advantage here. Also nil.empty? would raise a different error
    if label.nil? || label.empty?
      raise ArgumentError.new("Need a recipe name pls")
    end

    if uri.nil? || uri.empty?
      raise ArgumentError.new("Need a recipe uri pls")
    end

    @label = label
    @image = image
    @url = url
    @uri = uri
    @ingredientlines = ingredientlines
    @totalnutrients = totalnutrients
  end

#this is a factory method! it reads the data we got back from the api, and turns it into an instance of channel by calling self.new
  def self.from_api(raw_recipe)
    self.new(
      label: raw_recipe["label"],
      image: raw_recipe["image"],
      url: raw_recipe["url"],
      uri: raw_recipe["uri"],
      ingredientlines: raw_recipe["ingredientLines"],
      totalnutrients: raw_recipe["totalNutrients"])
  end
end
