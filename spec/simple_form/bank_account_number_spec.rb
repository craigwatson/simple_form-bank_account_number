require "simple_form/bank_account_number"

class CustomFormBuilder < SimpleForm::FormBuilder
  class << self
    def object
      "custom_object"
    end

    def lookup_model_names
      %w(model_name)
    end

    def text_field(*)
    end
  end
end

module SimpleForm::Inputs
  describe BankAccountNumberInput do
    describe ".formatted_bank_account_number" do
      def assert country, number, formatted_number
        expect(BankAccountNumberInput.formatted_bank_account_number(number, country)).to eq formatted_number
      end

      specify do
        assert "AU", "484795453513423", "484795-453513423"
        assert "GB", "40142431565517", "401424-31565517"
        assert "NZ", "041587005000000", "04-1587-0050000-00"
        assert "XX", "1234", "1234"
      end
    end

    describe "#input" do
      let(:options) do
        {
          country: "NZ",
          value: "041587005000000",
        }
      end

      it "generates the input field successfully" do
        input = BankAccountNumberInput.new(
          CustomFormBuilder, # builder class
          "test_attribute", # attribute_name
          "test_column", # column
          "bank_account_number", # input_type
          options
        )

        expect { input.input }.not_to raise_error
      end
    end
  end
end

