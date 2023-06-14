$output = []

def decode_char(ch)
   if(ch=='.-')
    return 'A'
   elsif(ch=='-...')
    return 'B'
   elsif(ch=='-.-.')
    return 'C'
   elsif(ch=='-..')
    return 'D'
   elsif(ch=='.')
    return 'E'
   elsif(ch=='..-.')
    return 'F'
   elsif(ch=='--.')
    return 'G'
   elsif(ch=='....')
    return 'H'
   elsif(ch=='..')
    return 'I'
   elsif(ch=='.---')
    return 'J'
   elsif(ch=='-.-')
    return 'K'
   elsif(ch=='.-..')
    return 'L'
   elsif(ch=='--')
    return 'M'
   elsif(ch=='-.')
    return 'N'
   elsif(ch=='---')
    return 'O'
   elsif(ch=='.--.')
    return 'P'
   elsif(ch=='--.-')
    return 'Q'
   elsif(ch=='.-.')
    return 'R'
   elsif(ch=='...')
    return 'S'
   elsif(ch=='-')
    return 'T'
   elsif(ch=='..-')
    return 'U'
   elsif(ch=='...-')
    return 'V'
   elsif(ch=='.--')
    return 'W'
   elsif(ch=='-..-')
    return 'X'
   elsif(ch=='-.--')
    return 'Y'
   elsif(ch=='--..')
    return 'Z'
   elsif(ch=='.----')
    return '1'
   elsif(ch=='..---')
    return '2'
   elsif(ch=='...--')
    return '3'
   elsif(ch=='....-')
    return '4'
   elsif(ch=='.....')
    return '5'
   elsif(ch=='-...')
    return '6'
   elsif(ch=='--...')
    return '7'
   elsif(ch=='---..')
    return '8'
   elsif(ch=='----.')
    return '9'
   elsif(ch=='-----')
    return '0'
   end
 end

def decode_word (word)
  $output = []
  chars = word.split('')
  combine = ''
  chars.each_with_index { |n, idx|
   if(n!=' ')
    if(idx==chars.length-1)
     combine += n
     $output.push(combine)
    else
     combine += n
    end
   else
    $output.push(combine)
    combine = ''
   end
 }
 answer = '';
 $output.each { |n|
 answer += decode_char(n).to_s
 }
 return answer
end

def decode_message (message)
  word = ''
  count = 0
  chars = message.split('')
  msg = ''
  chars.each_with_index { |n, idx|
    if(n==' ' && chars[idx+1]==' ' && chars[idx+2]==' ')
     msg += decode_word(word).to_s
     msg += ' '
     word = ''
      else
        if(idx==chars.length-1)
         word+=n
         msg += decode_word(word).to_s
        else
         word += n
        end
    end
  }
  print(msg)
end
