module MushafPageHelper
  def all_quran_fonts
    [
      ['Indopak hahafi-compressed', 'mushaf-indopak-nastaleeq-hanafi-compressed'],
      ['Indopak hahafi-normal', 'mushaf-indopak-nastaleeq-hanafi-normal'],
      ['QPC Nastaleeq', 'qpc-nastaleeq'],
      ['Al Qalam', 'mushaf-al_qalam'],
      ['QPC Hafs', 'qpc-hafs'],
      ['QPC Hafs color', 'qpc-hafs-color'],
      ['Me Quran', 'me_quran'],
      ['Digital Khatt', 'digitalkhatt'],
    ]
  end

  def mushaf_font_options(mushaf)
    font = mushaf.default_font_name

    if font.include?('indopak-nastaleeq') || font.include?('hanafi')
      [
        ['Normal', 'indopak-nastaleeq-hanafi-normal'],
        ['Compact', 'indopak-nastaleeq-hanafi-compact'],
        ['Compressed', 'indopak-nastaleeq-hanafi-compressed'],
        ['QPC Nastaleeq', 'qpc-nastaleeq'],
        ['al Qalam', 'al_qalam']
      ]
    elsif font.include?('madinah')
      [
        ['Normal', 'indopak-nastaleeq-madinah-normal'],
        ['Compact', 'indopak-nastaleeq-madinah-compact'],
        ['Compressed', 'indopak-nastaleeq-madinah-compressed'],
        ['QPC Nastaleeq', 'qpc-nastaleeq'],
        ['al Qalam', 'al_qalam'],
        ['Digital Khatt', 'digitalkhatt']
      ]
    elsif font.include? 'qpc-hafs'
      [
        ['QPC Hafs', 'qpc-hafs'],
        ['QPC Hafs color', 'qpc-hafs-color']
      ]
    else
      []
    end
  end

  def group_words_lines(words)
    lines = {}

    words.each do |w|
      lines[w.line_number] ||= {}
      lines[w.line_number][w.verse_id] ||= []

      lines[w.line_number][w.verse_id] << w
    end

    lines
  end
end

