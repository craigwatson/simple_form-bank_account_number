require "simple_form"
require "virtus"

module SimpleForm
  module BankAccountNumber
    module ValueObject
      def self.included(base)
        base.instance_eval do
          include Virtus.model(strict: true)
          private :attributes=
        end
      end
    end

    # A partial bank account number
    class Part
      include ValueObject

      attribute :label, String
      attribute :title, String
      attribute :format, Regexp
    end

    # A full bank account number format
    class Format
      include ValueObject

      attribute :parts, Array[Part]
      attribute :multiline, Boolean

      def self.for_country(alpha2)
        COUNTRIES[alpha2.upcase] || COUNTRIES[nil]
      end

      COUNTRIES = {
        "AU" => Format.new(
          parts: [
            { label: "BSB Number", title: "6 digit BSB number", format: /\d{6}/ },
            { label: "Account Number", title: "6 to 9 digit account number", format: /\d{6,9}/ },
          ],
          multiline: true,
        ),
        "CA" => Format.new(
          parts: [
            { label: "Transit Number", title: "8 or 9 digit transit number", format: /\d{8,9}/ },
            { label: "Account Number", title: "7 to 12 digit account number", format: /\d{7,12}/ },
          ],
          multiline: true,
        ),
        "GB" => Format.new(
          parts: [
            { label: "Sort Code", title: "6 digit sort code", format: /\d{6}/ },
            { label: "Account Number", title: "7 to 10 digit account number", format: /\d{7,10}/ },
          ],
          multiline: true,
        ),
        "NZ" => Format.new(
          parts: [
            { label: "Bank Number", title: "2 digit bank number", format: /\d{2}/ },
            { label: "Branch Number", title: "4 digit branch number", format: /\d{4}/ },
            { label: "Account Number", title: "7 digit account number", format: /\d{7}/ },
            { label: "Suffix", title: "2 or 3 digit suffix", format: /\d{2,3}/ },
          ],
          multiline: false,
        ),
        nil => Format.new( # NOTE: default format
          parts: [
            { label: "Account Number", title: "account number", format: /[A-Z0-9]+/ }
          ],
          multiline: false,
        )
      }.freeze
    end
  end
end
