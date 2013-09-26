module SimpleForm
  module BankAccountNumber
    COUNTRIES = {
      "AU" => [
        { label: "6 digit BSB number", format: /\d{6}/ },
        { label: "6 to 9 digit account number", format: /\d{6,9}/ },
      ],
      "CA" => [
        { label: "8 or 9 digit transit number", format: /\d{8,9}/ },
        { label: "7 to 12 digit account number", format: /\d{7,12}/ },
      ],
      "GB" => [
        { label: "6 digit sort code", format: /\d{6}/ },
        { label: "7 to 10 digit account number", format: /\d{7,10}/ },
      ],
      "NZ" => [
        { label: "2 digit bank number", format: /\d{2}/ },
        { label: "4 digit branch number", format: /\d{4}/ },
        { label: "7 digit account number", format: /\d{7}/ },
        { label: "2 or 3 digit suffix", format: /\d{2,3}/ },
      ],
    }

    DEFAULT_FORMAT = [
      { label: "account number", format: /[A-Z0-9]+/ }
    ]
  end
end

