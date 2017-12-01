module Extractable
  extend ActiveSupport::Concern

  AUTHORS_REGEX = /\[[^\]]*\]/ # remove [] from authors list

  def extract_authors(description)
    authors = description['Author']
    authors_array = authors.gsub(AUTHORS_REGEX, '').split(', ')
    authors_array.map { |name| Author.find_or_create_by(name: name) }
  end

  def extract_maintainer(description)
    maintainers = description['Maintainer']
    maintainer_data = maintainers.split(' <')
    name = maintainer_data.first
    email = maintainer_data.last.delete('>')
    Maintainer.find_or_create_by(name: name, email: email)
  end

  def extract_description(package)
    gz = Zlib::GzipReader.new(open(package.tmp_file))
    reader = Minitar::Reader.new(gz)
    raw_description = reader.each_entry.find { |f| f.name.match?(/DESCRIPTION/) }.read
    Dcf.parse(raw_description).first
  end
end
