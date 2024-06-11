class TmpBinFile
  delegate_missing_to :@file

  def initialize(basename = "", data: nil)
    @file = Tempfile.open(basename, Rails.root.join("tmp"), binmode: true, mode: File::Constants::BINARY)
    @file.write(data) if data
  end

  def to_spreadsheet
    Roo::Spreadsheet.open(@file, extension: :xlsx)
  end

  def to_s
    binread
  end

  def binread
    File.binread(@file)
  end
end
