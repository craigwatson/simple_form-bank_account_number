module SimpleForm
  module BankAccountNumber
    COUNTRIES = {
      "AU" => [
        { label: "6 digit BSB number", format: /\d{6}/ },
        { label: "9 digit account number", format: /\d{9}/ },
      ],
      "CA" => [
        { label: "5 digit branch number", format: /\d{5}/ },
        { label: "3 digit institution number", format: /\d{3}/ },
        { label: "account number", format: /\d+/ },
      ],
      "GB" => [
        { label: "6 digit sort code", format: /\d{6}/ },
        { label: "8 digit account number", format: /\d{8}/ },
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

