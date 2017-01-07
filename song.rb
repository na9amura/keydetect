class Song
  attr_accessor :file,
    :keydetect_out,
    :original_key,
    :change_cents,
    :repitched_file,
    :changed_key

  KEYFINDER_CLI = '~/dev/keydetect/keyfinder-cli/keyfinder-cli'

  PITCH_SPAN = {
    'Cb' => -100,
    'C'  => 0,
    'C#' => 100,
    'Db' => 100,
    'D'  => 200,
    'D#' => 300,
    'Eb' => 300,
    'E'  => 400,
    'F'  => 500,
    'F#' => 600,
    'Gb' => 600,
    'G'  => 700,
    'G#' => 800,
    'Ab' => 800,
    'A'  => 900,
    'A#' => 1000,
    'Bb' => 1000,
    'B'  => 1100,
  }.freeze

  def initialize(file)
    self.file = file
    self.keydetect_out = keydetect(file)
    self.original_key = strip_to_key
    self.change_cents = cent_from_C * -1
  end

  # keydetect-cliでキーを判定
  def keydetect(file)
    sysout = ''
    command = "#{ KEYFINDER_CLI } #{ file.path } -n standard"
    IO.popen(command, 'r') do |io|
      sysout = io.gets
      io.close_write
    end
    return sysout
  end

  # Cからのピッチをcentにする
  def cent_from_C
    raise 'key not found' unless PITCH_SPAN.key? original_key
    return PITCH_SPAN[original_key]
  end

  # keydetect_outは"#{ key }#{ Major_or_minor }"の形式を想定
  def strip_to_key
    if keydetect_out =~ /^[A-Z][b|#]/
      return keydetect_out[0..1]
    else
      return keydetect_out[0]
    end
  end

  # soxを使ってCにピッチ変換
  def change_pitch(out_path = './out')
    self.repitched_file = "#{ out_path }/#{ out_file_name() }"
    command = "sox #{ file.path } #{ repitched_file } pitch #{ change_cents }"
    IO.popen(command) do |io|
      puts io.gets
      io.close_write
    end
    self.changed_key = confirm_pitch()
  end

  def out_file_name
    "#{ File.basename(file.path, '.*') }_#{ change_cents }.wav"
  end

  # 変換結果のキー判定
  def confirm_pitch
    keydetect(File.open(repitched_file))
  end
end
