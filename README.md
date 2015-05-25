# SimpleForm::BankAccountNumber

[![Build Status](https://travis-ci.org/buckybox/simple_form-bank_account_number.svg?branch=master)](https://travis-ci.org/buckybox/simple_form-bank_account_number)
[![Dependency Status](http://img.shields.io/gemnasium/buckybox/simple_form-bank_account_number.svg)](https://gemnasium.com/buckybox/simple_form-bank_account_number)
[![Gem Version](http://img.shields.io/gem/v/simple_form-bank_account_number.svg)](https://rubygems.org/gems/simple_form-bank_account_number)

A [SimpleForm](https://github.com/plataformatec/simple_form) input field for bank account numbers.

## Usage

Just create a new input field with `:bank_account_number` as its type.
Note that you need to explicitly set the `country` and `value` options, like this:

`f.input_field :account_number, as: :bank_account_number, country: user.country, value: user.account_number`

- the country is the [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) representation
- the value can't be inferred automatically unfortunately so you have to set it explicitly

Also note that you'll get multiple values for each number part upon form submission.
You probably want to concatenate them into one single number for your backend with something along these lines:

`params[:bank_deposit][:account_number] = params[:bank_deposit][:account_number].join`

## License

MIT
