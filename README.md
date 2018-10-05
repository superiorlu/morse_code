# MorseCode

Simple Morse Code Encode and Decode Tool

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'morse-code-rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install morse-code-rb

## Usage

### Encode

```ruby
require 'morse_code'

content = 'I am Robot.'
encode_content = MorseCode::Encoder.new(content).encode
dit_dah = MorseCode::Encoder.new(content).dit_dah
puts encode_content
puts dit_dah

$> .. .- -- .-. --- -... --- - .-.-.-
$> DITDIT DITDAH DAHDAH DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH
```

### Decode

```ruby
require 'morse_code'

content = '.. .- -- .-. --- -... --- - .-.-.-'
decode_content = MorseCode::Decoder.new(content).decode
puts decode_content
$> I A M R O B O T .

dit_dah = 'DITDIT DITDAH DAHDAH DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH'
dit_dah_to = MorseCode::Decoder.new(dit_dah).dit_dah_to
puts dit_dah_to
$> I A M R O B O T .
```

### Contributing

#### Fork the Project

```shell
$ git https://github.com/superiorlu/morse_code.git
$ cd morse_code
$ git remote add upstream https://github.com/superiorlu/morse_code.git
```

#### Create a Toptic Branch

```shell
$ git checkout master
$ git pull upstream master
$ git checkout -b my-feature-branch
```

#### Run Test

```shell
$ bundle exec rake test
```

#### Make a Pull Request

Click the `'Pull Request'` button and fill out the form.

### License

MIT License. See [LICENSE](https://github.com/superiorlu/morse_code/blob/master/LICENSE.md) for details.
