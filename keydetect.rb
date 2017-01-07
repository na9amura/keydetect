require_relative 'song'
@accepted_formats = ['.mp3', '.wav', '.wave']
@resource_path = './resources'

# # NOTE: デバッグ用1ファイル処理
# File.open "#{ @resource_path }/01_collection.mp3" do |file|
#   song = Song.new(file)
#   song.change_pitch
#   puts song.inspect
# end

Dir.foreach(@resource_path) do |item|
  next if item.start_with? '.'
  next if item.extname.in? @accepted_formats
  File.open "#{ @resource_path }/#{ item }" do |file|
    song = Song.new(file)
    song.change_pitch
    puts song.inspect
  end
end
