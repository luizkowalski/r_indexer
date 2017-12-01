module Downloadable
  extend ActiveSupport::Concern

  def download
    return Rails.logger.info "File already downloaded: #{tmp_file}" if File.exist? tmp_file
    source = open(external_address)
    IO.copy_stream(source, tmp_file)
  end
end
