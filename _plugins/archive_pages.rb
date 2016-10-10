module Jekyll

  class ArchivePage < Page
    def initialize(site, base, dir)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'archive_index.html')
      self.data['title'] = 'Archives'

      docs = site.collections['posts'].docs

      archives = docs.reduce({}) do |acc, doc|
        acc[doc.date.year] ||= [];
        acc[doc.date.year].push doc
        acc
      end

      self.data['archives'] = archives
      self.data['years'] = archives.keys.sort.reverse
    end
  end

  class ArchivePageGenerator < Generator
    safe true

    def generate(site)
      return unless site.layouts.key? 'archive_index'

      dir = site.config['archives_dir'] || 'archives'
      site.pages << ArchivePage.new(site, site.source, dir)
    end
  end

end
