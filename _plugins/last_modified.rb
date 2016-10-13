module Jekyll
  module LastModifiedFilter
    def last_modified(page)
      File.mtime(page['path'])
    end
  end
end

Liquid::Template.register_filter(Jekyll::LastModifiedFilter)
