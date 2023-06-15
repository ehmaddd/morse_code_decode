MORSE_CODE = {
  '.-' => 'A',
  '-...' => 'B',
  '-.-.' => 'C',
  '-..' => 'D',
  '.' => 'E',
  '..-.' => 'F',
  '--.' => 'G',
  '....' => 'H',
  '..' => 'I',
  '.---' => 'J',
  '-.-' => 'K',
  '.-..' => 'L',
  '--' => 'M',
  '-.' => 'N',
  '---' => 'O',
  '.--.' => 'P',
  '--.-' => 'Q',
  '.-.' => 'R',
  '...' => 'S',
  '-' => 'T',
  '..-' => 'U',
  '...-' => 'V',
  '.--' => 'W',
  '-..-' => 'X',
  '-.--' => 'Y',
  '--..' => 'Z'
}.freeze

def decode_char(char)
  MORSE_CODE[char]
end

def decode_word(word)
  chars = word.chars
  combine = ''
  output = []

  chars.each do |n|
    if n == ' '
      output.push(combine) unless combine.empty?
      combine = ''
    else
      combine += n
    end
  end

  output.map { |n| decode_char(n).to_s }.join
end

def decode_message(message)
  chars = message.chars
  word = ''
  output = ''

  chars.each do |n|
    if n == ' '
      output += "#{decode_word(word)} " unless word.empty?
      word = ''
    else
      word += n
    end
  end

  output += decode_word(word).to_s
  puts output
end
