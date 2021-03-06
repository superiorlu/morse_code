# MorseCode

Simple Morse Code Encode and Decode Tool

[![Gem Version](http://img.shields.io/gem/v/morse-code-rb.svg)](https://rubygems.org/gems/morse-code-rb) [![Build Status](https://travis-ci.org/superiorlu/morse_code.svg)](https://travis-ci.org/superiorlu/morse_code) [![Maintainability](https://api.codeclimate.com/v1/badges/62b6eb7ed9b65c62d3f6/maintainability)](https://codeclimate.com/github/superiorlu/morse_code/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/62b6eb7ed9b65c62d3f6/test_coverage)](https://codeclimate.com/github/superiorlu/morse_code/test_coverage) [![GitHub license](https://img.shields.io/github/license/superiorlu/morse_code.svg)](https://github.com/superiorlu/morse_code/blob/master/LICENSE.md)

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
MorseCode::Encoder.new(content).encode
=> ".. / .- -- / .-. --- -... --- - .-.-.-"

MorseCode::Encoder.new(content).dit_dah
=> "DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH"

content = 'I am Chinese 我是中国人'
MorseCode::Encoder.new(content).encode
=> ".. / .- -- / -.-. .... .. -. . ... . / --...-....-...- --..--...-.---- -..---...-.--.- -.-.--.------.- -..---.-.---.-."

MorseCode::Encoder.new(content).dit_dah
=> "DITDIT / DITDAH DAHDAH / DAHDITDAHDIT DITDITDITDIT DITDIT DAHDIT DIT DITDITDIT DIT / DAHDAHDITDITDITDAHDITDITDITDITDAHDITDITDITDAH DAHDAHDITDITDAHDAHDITDITDITDAHDITDAHDAHDAHDAH DAHDITDITDAHDAHDAHDITDITDITDAHDITDAHDAHDITDAH DAHDITDAHDITDAHDAHDITDAHDAHDAHDAHDAHDAHDITDAH DAHDITDITDAHDAHDAHDITDAHDITDAHDAHDAHDITDAHDIT"
```

#### Generate Wave File

```ruby
require 'morse_code'

content = 'I am Robot.'
MorseCode::Encoder.new(content).wave
=> "/tmp/morse_code-5b9b3aa176.wav"
```
you can open [wavefile](https://pan.baidu.com/s/1TtpfOzJplyFLDu_hbk8V7A) and listen to the morse code sound.


### Decode

```ruby
require 'morse_code'

content = '.. / .- -- / .-. --- -... --- - .-.-.-'
MorseCode::Decoder.new(content).decode
=> "I AM ROBOT."

dit_dah = 'DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH'
MorseCode::Decoder.new(dit_dah).dit_dah_to
=> "I AM ROBOT."

content = '.. / .- -- / -.-. .... .. -. . ... . / --...-....-...- --..--...-.---- -..---...-.--.- -.-.--.------.- -..---.-.---.-.'
MorseCode::Decoder.new(content).decode
=> "I AM CHINESE 我是中国人"
```

### Terminal

```shell
$> mc
mc commands:
  mc decode MESSAGE  # decode Morse Code as original message
  mc encode MESSAGE  # encode message as Morse Code
  mc help [COMMAND]  # Describe available commands or one specific command
```

#### encode

```shell
$> mc help encode
Usage:
  mc encode MESSAGE

Options:
  -d, [--dit-dah], [--no-dit-dah]  # encode DITDAH message
  -w, [--wave], [--no-wave]        # gen morse code wav

encode message as Morse Code
```

```shell
$> mc -e 'I am Robot.'
=> ".. / .- -- / .-. --- -... --- - .-.-.-"

$> mc -e 'I am Robot.' --dit-dah
=> "DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH"

$> mc -e 'I am Chinese 我是中国人'
=> ".. / .- -- / -.-. .... .. -. . ... . / --...-....-...- --..--...-.---- -..---...-.--.- -.-.--.------.- -..---.-.---.-."

$> mc -e -w 'I am Chinese 我是中国人'
=> ".. / .- -- / -.-. .... .. -. . ... . / --...-....-...- --..--...-.---- -..---...-.--.- -.-.--.------.- -..---.-.---.-."
=> "Generate wave file: /tmp/morse_code-0d56cd233e.wav"
```

you can open [wavefile](https://pan.baidu.com/s/1v5RcZSsYOHBxkF7nsbAz_g) and listen to the morse code sound.

#### decode

```shell
$> mc -d '.. / .- -- / .-. --- -... --- - .-.-.-'
=> "I AM ROBOT."

$> mc -d 'DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH' --dit-dah
=> "I AM ROBOT."

$> mc -d '.. / .- -- / -.-. .... .. -. . ... . / --...-....-...- --..--...-.---- -..---...-.--.- -.-.--.------.- -..---.-.---.-.'
=> "I AM CHINESE 我是中国人"
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

### Resource
 - [Learn More Code](http://www.learnmorsecode.com/)
 - [Morse Pro](https://github.com/scp93ch/morse-pro)
 - [Wavefile](https://github.com/jstrait/wavefile)

### License

MIT License. See [LICENSE](https://github.com/superiorlu/morse_code/blob/master/LICENSE.md) for details.
