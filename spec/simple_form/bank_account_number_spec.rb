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
