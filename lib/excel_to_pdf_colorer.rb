# frozen_string_literal: true

require_relative "excel_to_pdf_colorer/version"
require_relative "excel_to_pdf_colorer/*"

module ExcelToPdfColorer
  class Error < StandardError; end

  PdfGenerator.call(Importer.call)
  puts Importer.Target
end
