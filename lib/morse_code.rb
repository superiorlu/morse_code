require 'morse_code/version'
require 'morse_code/error'
require 'morse_code/encoder'
require 'morse_code/decoder'

module MorseCode
  ENCODE_MAP = Hash[*%w/
    A .-           1 .----
    B -...         2 ..---
    C -.-.         3 ...--
    D -..          4 ....-
    E .            5 .....
    F ..-.         6 -....
    G --.          7 --...
    H ....         8 ---..
    I ..           9 ----.
    J .---         0 -----
    K -.-          . .-.-.-
    L .-..         , --..--
    M --           ? ..--..
    N -.           \/ -..-.
    O ---          : ---...
    P .--.         ; -.-.-.
    Q --.-         = -...-
    R .-.          + .-.-.
    S ...          - -....-
    T -            _ ..--.-
    U ..-          " .-..-.
    V ...-         $ ...-..-
    W .--          @ .--.-.
    X -..-
    Y -.--
    Z --..
  /]

  DECODE_MAP = ENCODE_MAP.invert
end
