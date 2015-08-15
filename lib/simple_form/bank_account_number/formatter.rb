require "simple_form"
require "simple_form/bank_account_number/countries"

module SimpleForm
  module BankAccountNumber
    class Formatter
      def self.formatted_bank_account_number(full_number, country)
        full_number = full_number.to_s.dup
        format = Format.for_country(country)

        fields = format.parts.inject({}) do |hash, part|
          length = part.format.source.scan(/\b\d}/).map(&:to_i).max
          field = full_number.slice!(0, length || full_number.length)

          hash.merge!(part.label => field)
        end

        unless full_number.empty?
          raise ArgumentError, "format does not match (#{full_number.length} extra digits)"
        end

        new(fields, country)
      end

      def initialize(fields, country)
        @fields = fields
        @country = country
      end

      def to_s(value_separator: ": ", field_separator: "\n")
        hash = if multiline?
          to_h
        else
          { "Account Number" => to_h.values.join("-") } # TODO: i18n
        end

        hash.map do |label, value|
          [label, value_separator, value].join
        end.join(field_separator)
      end

      def to_h
        @fields
      end

      def parts
        @fields.values
      end

      def multiline?
        Format.for_country(@country).multiline
      end
    end
  end
end
