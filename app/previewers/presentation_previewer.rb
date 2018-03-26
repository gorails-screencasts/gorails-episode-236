class PresentationPreviewer < ActiveStorage::Previewer
  CONTENT_TYPES = [
    "application/vnd.openxmlformats-officedocument.presentationml.presentation", # .pptx
    "application/vnd.ms-powerpoint", # .ppt
  ]

  class << self
    def accept?(blob)
      CONTENT_TYPES.include?(blob.content_type) && libreoffice_exists?
    end

    def libreoffice_path
      ActiveStorage.paths[:libreoffice] || "libreoffice"
    end

    def libreoffice_exists?
      return @libreoffice_exists unless @libreoffice_exists.nil?

      system libreoffice_path, "--version", out: File::NULL, err: File::NULL

      @libreoffice_exists = $?.exitstatus == 0
    end
  end

  def preview
    download_blob_to_tempfile do |input|
      draw_first_page_from input do |output|
        yield io: output, filename: "#{blob.filename.base}.png", content_type: "image/png"
      end
    end
  end

  private

    def draw_first_page_from(file, &block)
      directory = File.dirname(file.path)
      basename  = File.basename(file.path, ".*")
      png_file  = File.join(directory, "#{basename}.png")

      system self.class.libreoffice_path, "--headless", "--invisible", "--convert-to", "png", "--outdir", directory, file.path
      draw "cat", png_file, &block

      File.delete(png_file)
    end
end
