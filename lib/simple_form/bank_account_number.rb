require "simple_form"
require "simple_form/bank_account_number/countries"
require "simple_form/bank_account_number/version"

module SimpleForm
  module Inputs
    class BankAccountNumberInput < NumericInput
      def self.formatted_bank_account_number(full_number, country)
        full_number = full_number.dup

        fields = number_format(country).map do |part|
          length = part[:format].source.scan(/\b\d}/).map(&:to_i).max
          full_number.slice!(0, length || full_number.length)
        end

        unless full_number.empty?
          raise ArgumentError, "format does not match (#{full_number.length} extra digits)"
        end

        fields.join("-")
      end

      # requires to set :country and :value
      def input
        country = options.delete(:country) || raise(ArgumentError, "You must set the :country key.")
        full_number = options.fetch(:value) || ""
        parts = self.class.formatted_bank_account_number(full_number, country).split("-").reverse

        fields = self.class.number_format(country).map do |part|
          input_html_options[:required] = "required"
          input_html_options[:autocomplete] = "off"
          input_html_options[:name] = "#{lookup_model_names.join('_')}[#{reflection_or_attribute_name}][]"
          input_html_options[:pattern] = "^#{part[:format].source}$"
          input_html_options[:title] = part[:label]
          input_html_options[:style] = "width: auto; display: inline; margin-right: .2em"
          input_html_options.delete(:country) # don't include it in the markup

          # Twitter Bootstrap tooltips
          input_html_options["data-toggle"] = "tooltip"
          input_html_options["data-original-title"] = part[:label]
          input_html_options["data-placement"] = "bottom"

          if length = part[:format].source.scan(/\b\d}/).map(&:to_i).max
            input_html_options[:size] = length
            input_html_options[:maxlength] = length
          else
            input_html_options[:size] = nil
            input_html_options[:maxlength] = nil
          end

          input_html_options[:value] = parts.pop

          super
        end

        fields.join
      end

    private

      def self.number_format(country)
        SimpleForm::BankAccountNumber::COUNTRIES[country.upcase] ||
          SimpleForm::BankAccountNumber::DEFAULT_FORMAT
      end
    end
  end
end
