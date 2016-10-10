module Jekyll

  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category'] = category

      category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      self.data['title'] = "#{category_title_prefix}#{category}"
    end
  end

  class CategoriesIndexPage < Page
    def initialize(site, base, dir)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'categories_index.html')
      self.data['title'] = 'Categories'
      self.data['categories'] = site.categories.keys.sort.map do |key|
        { 'name' => key, 'url' => "/categories/#{key.downcase}" }
      end
    end
  end


  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      dir = site.config['category_dir'] || 'categories'

      if site.layouts.key? 'categories_index'
        site.pages << CategoriesIndexPage.new(site, site.source, dir)
      end

      if site.layouts.key? 'category_index'
        site.categories.each_key do |category|
          site.pages << CategoryPage.new(site, site.source, File.join(dir, category.downcase), category)
        end
      end
    end
  end

end
