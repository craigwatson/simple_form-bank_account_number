module SimpleForm
  module BankAccountNumber
    COUNTRIES = {
      "AU" => [
        { label: "BSB number", format: /\d{6}/ },
        { label: "account number", format: /\d{9}/ },
      ],
      "NZ" => [
        { label: "bank number", format: /\d{2}/ },
        { label: "branch number", format: /\d{4}/ },
        { label: "account number", format: /\d{6}/ },
        { label: "suffix", format: /\d{2,3}/ },
      ],
    }

    DEFAULT_FORMAT = [
      { label: "account number", format: /[A-Z0-9]+/ }
    ]
  end
end

