require 'date'

module Jekyll
  module LastModifiedFilter
    def last_modified(page)
      path = page['path']
      if File.exist?(path)
        File.mtime(path)
      else
        DateTime.now
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::LastModifiedFilter)
