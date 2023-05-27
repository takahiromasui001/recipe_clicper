require 'open-uri'
require 'nokogiri'

class Recipe::RecipeCreator
  def create!(recipe)
    image_data = RecipeScreenshot.new.build_image(recipe.url)
    recipe.screenshot.attach(io: StringIO.new(image_data), content_type: 'image/png', filename: 'recipe_screenshot')
    og_image = fetch_og_image(recipe.url)
    og_image.present? && recipe.thumbnail.attach(io: URI.parse(og_image).open, content_type: 'image/png', filename: 'recipe_thumbnail')

    raise unless recipe.save!
  end

  def fetch_og_image(url)
    max_retries = 3
    retries = 0

    begin
      html = URI.parse(url).open
    rescue OpenURI::HTTPError => e
      retries += 1

      raise e if retries > max_retries

      sleep(1) # Optional: wait a second before retrying
      retry
    end
    meta_element = Nokogiri::HTML(html).at('meta[property="og:image"]')
    meta_element ? meta_element['content'] : nil
  end
end
