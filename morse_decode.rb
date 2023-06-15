output = []

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

def decode_char(ch)
  MORSE_CODE[ch]
end

def decode_word(word)
  $output = []
  chars = word.split('')
  combine = ''

  chars.each_with_index do |n, idx|
    if n != ' '
      if idx == chars.length - 1
        combine += n
        $output.push(combine)
      else
        combine += n
      end
    else
      $output.push(combine) unless combine.empty?
      combine = ''
    end
  end

  answer = ''
  $output.each { |n| answer += decode_char(n).to_s }
  answer
end

def decode_message(message)
  word = ''
  count = 0
  chars = message.split('')
  msg = ''

  chars.each_with_index do |n, idx|
    if n == ' ' && chars[idx + 1] == ' ' && chars[idx + 2] == ' '
      msg += decode_word(word).to_s
      msg += ' '
      word = ''
    else
      if idx == chars.length - 1
        word += n
        msg += decode_word(word).to_s
      else
        word += n
      end
    end
  end

  print(msg)
end
