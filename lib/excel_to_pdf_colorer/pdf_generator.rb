# frozen_string_literal: true

require "erb"

module PdfGenerator
  extend self

  Style = "../../misc/pdf.css"
  Template = "../../misc/template.html.erb"
  Output = "../../misc/output.html"

  def template_to_html(**args)
    args.each do |k, v|
      define_method(k) { v }
    end

    (ERB.new File.read Template).result
  end

  def write_pdf(html)
    p = PDFKit.new(html)
    p.stylesheets << Style
    p.to_file Output
  end

  def call = write_pdf(template_to_html(args))
end
