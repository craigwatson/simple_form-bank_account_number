require "simple_form"

module SimpleForm
  module BankAccountNumber
    COUNTRIES = {
      "AU" => {
        parts: [
          { label: "BSB Number", title: "6 digit BSB number", format: /\d{6}/ },
          { label: "Account Number", title: "6 to 9 digit account number", format: /\d{6,9}/ },
        ],
        multiline: true,
      },
      "CA" => {
        parts: [
          { label: "Transit Number", title: "8 or 9 digit transit number", format: /\d{8,9}/ },
          { label: "Account Number", title: "7 to 12 digit account number", format: /\d{7,12}/ },
        ],
        multiline: true,
      },
      "GB" => {
        parts: [
          { label: "Sort Code", title: "6 digit sort code", format: /\d{6}/ },
          { label: "Account Number", title: "7 to 10 digit account number", format: /\d{7,10}/ },
        ],
        multiline: true,
      },
      "NZ" => {
        parts: [
          { label: "Bank Number", title: "2 digit bank number", format: /\d{2}/ },
          { label: "Branch Number", title: "4 digit branch number", format: /\d{4}/ },
          { label: "Account Number", title: "7 digit account number", format: /\d{7}/ },
          { label: "Suffix", title: "2 or 3 digit suffix", format: /\d{2,3}/ },
        ],
        multiline: false,
      },
    }.freeze

    DEFAULT_FORMAT = {
      parts: [
        { label: "Account Number", title: "account number", format: /[A-Z0-9]+/ }
      ],
      multiline: false,
    }.freeze
  end
end
