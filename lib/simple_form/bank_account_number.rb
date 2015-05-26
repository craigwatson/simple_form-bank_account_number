require "simple_form"
require "simple_form/bank_account_number/formatter"

module SimpleForm
  module Inputs
    class BankAccountNumberInput < NumericInput
      def input
        country = options.delete(:country) || raise(ArgumentError, "You must set the :country key.")
        full_number = options.fetch(:value, "")
        parts = BankAccountNumber::Formatter.formatted_bank_account_number(full_number, country).to_h.values
        format = BankAccountNumber::Formatter.number_format(country)

        format.fetch(:parts).map do |part|
          input_html_options.delete(:country) # don't include it in the markup

          input_html_options[:required] = "required"
          input_html_options[:autocomplete] = "off"
          input_html_options[:name] = "#{lookup_model_names.join('_')}[#{reflection_or_attribute_name}][]"
          input_html_options[:pattern] = "^#{part.fetch(:format).source}$"
          input_html_options[:title] = part.fetch(:title)
          input_html_options[:style] = "width: auto; display: inline; margin-right: .2em"
          input_html_options["data-label"] = part.fetch(:label)
          input_html_options["data-multiline"] = format.fetch(:multiline)

          # Twitter Bootstrap tooltips
          input_html_options["data-toggle"] = "tooltip"
          input_html_options["data-original-title"] = part.fetch(:title)
          input_html_options["data-placement"] = "bottom"

          if length = part.fetch(:format).source.scan(/\b\d}/).map(&:to_i).max
            input_html_options[:size] = length
            input_html_options[:maxlength] = length
          else
            input_html_options[:size] = nil
            input_html_options[:maxlength] = nil
          end

          input_html_options[:value] = parts.shift

          super
        end.join
      end
    end
  end
end
