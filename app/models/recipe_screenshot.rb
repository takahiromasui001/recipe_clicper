require 'puppeteer-ruby'

class RecipeScreenshot
  def build_image(url)
    Puppeteer.launch(headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox', '--font-render-hinting=medium', '--font-kerning=normal', '--font-render-hinting=medium']) do |browser|
      page = browser.new_page
      page.goto(url)

      page.screenshot(full_page: true)
    end
  end
end
