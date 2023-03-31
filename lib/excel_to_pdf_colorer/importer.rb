# frozen_string_literal: true

module Importer
  extend self
  Target = ARGV[0] || "../../misc/imported.pdf"

  def dump = SimpleXlsxReader.open(Target).slurp

  def call
    unless File.exist? Target
      warn "#{Target} dosyası bulunamadı."
      exit(2)
    end

    raise "Ne yapacağım? İçerik ne? HTML şablonu ne? Bunu bilmeliyim: #{dump}"
  end
end
