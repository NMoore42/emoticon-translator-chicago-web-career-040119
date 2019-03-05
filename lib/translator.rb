# require modules here
require "yaml"
#emoticons = YAML.load_file('lib/emoticons.yml')

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  return_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |emoticon_type, emoticon_detail|
    return_hash["get_meaning"][emoticons[emoticon_type][1]] = emoticon_type
    return_hash["get_emoticon"][emoticons[emoticon_type][0]] = emoticons[emoticon_type][1]
  end
  return_hash
end


def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  library["get_emoticon"].each do |english_emoticon, japanese_emoticon|
    if emoticon == english_emoticon
      return japanese_emoticon
    end
  end
  return "Sorry, that emoticon was not found"
end


def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  library["get_meaning"].each do |japanese_emoticon, meaning|
    if emoticon == japanese_emoticon
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end
