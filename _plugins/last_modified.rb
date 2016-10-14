require 'date'

module Jekyll
  module LastModifiedFilter
    def last_modified(page)
      if File.exist?(page['path'])
        File.mtime(page['path'])
      else
        DateTime.now
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::LastModifiedFilter)
