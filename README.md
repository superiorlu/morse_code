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
$> ".. / .- -- / .-. --- -... --- - .-.-.-"

MorseCode::Encoder.new(content).dit_dah
$> "DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH"

content = '我是中国人'
MorseCode::Encoder.new(content).encode
$> "--...-....-...- --..--...-.---- -..---...-.--.- -.-.--.------.- -..---.-.---.-."

MorseCode::Encoder.new(content).dit_dah
$> "DAHDAHDITDITDITDAHDITDITDITDITDAHDITDITDITDAH DAHDAHDITDITDAHDAHDITDITDITDAHDITDAHDAHDAHDAH DAHDITDITDAHDAHDAHDITDITDITDAHDITDAHDAHDITDAH DAHDITDAHDITDAHDAHDITDAHDAHDAHDAHDAHDAHDITDAH DAHDITDITDAHDAHDAHDITDAHDITDAHDAHDAHDITDAHDIT"
```

### Decode

```ruby
require 'morse_code'

content = '.. / .- -- / .-. --- -... --- - .-.-.-'
MorseCode::Decoder.new(content).decode
$> "I AM ROBOT."

dit_dah = 'DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH'
MorseCode::Decoder.new(dit_dah).dit_dah_to
$> "I AM ROBOT."

content = '--...-....-...- --..--...-.---- -..---...-.--.- -.-.--.------.- -..---.-.---.-.'
MorseCode::Decoder.new(content).decode
$> "我是中国人"
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
$> mc -e 'I am Robot.'
$> ".. / .- -- / .-. --- -... --- - .-.-.-"

$> mc -e 'I am Robot.' --dit-dah
$> "DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH"

$> mc -e '我是中国人'
$> "--...-....-...- --..--...-.---- -..---...-.--.- -.-.--.------.- -..---.-.---.-."
```

#### decode

```shell
$> mc -d '.. / .- -- / .-. --- -... --- - .-.-.-'
$> "I AM ROBOT."

$> mc -d 'DITDIT / DITDAH DAHDAH / DITDAHDIT DAHDAHDAH DAHDITDITDIT DAHDAHDAH DAH DITDAHDITDAHDITDAH' --dit-dah
$> "I AM ROBOT."

$> mc -d '--...-....-...- --..--...-.---- -..---...-.--.- -.-.--.------.- -..---.-.---.-.'
$> "我是中国人"
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
