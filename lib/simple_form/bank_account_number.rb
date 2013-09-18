require "simple_form"
require "simple_form/bank_account_number/countries"
require "simple_form/bank_account_number/version"

module SimpleForm
  module Inputs
    class BankAccountNumberInput < NumericInput
      # requires to set :country and :value
      def input
        country = options.delete(:country) || raise(ArgumentError, "You must set the :country key.")

        number = SimpleForm::BankAccountNumber::COUNTRIES[country.upcase]
        number ||= SimpleForm::BankAccountNumber::DEFAULT_FORMAT

        full_number = options.fetch(:value) || ""
        from = 0

        fields = number.map do |part|
          length = part[:format].source.scan(/\b\d\b/).map(&:to_i).max

          input_html_options[:required] = true
          input_html_options[:name] = "#{lookup_model_names.join("_")}[#{reflection_or_attribute_name}][]"
          input_html_options[:pattern] = "^#{part[:format].source}$"
          input_html_options[:title] = part[:label]
          input_html_options[:style] = "width: auto; display: inline; margin-right: .2em"

          # Twitter Bootstrap tooltips
          input_html_options["data-toggle"] = "tooltip"
          input_html_options["data-original-title"] = part[:label]
          input_html_options["data-placement"] = "bottom"

          if length
            from += length
            input_html_options[:size] = length
            input_html_options[:maxlength] = length
          else
            input_html_options[:size] = nil
            input_html_options[:maxlength] = nil
          end

          input_html_options[:value] = full_number.slice!(0, length || full_number.length)

          super
        end

        fields.join
      end
    end
  end
end

