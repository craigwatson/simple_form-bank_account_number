require "simple_form/bank_account_number/formatter"

module SimpleForm
  module BankAccountNumber
    describe Formatter do
      describe ".formatted_bank_account_number" do
        def assert(country, number, formatted_number)
          expect(Formatter.formatted_bank_account_number(number, country).to_h).to eq formatted_number
        end

        specify do
          assert "AU", "484795453513423", "BSB Number" => "484795", "Account Number" => "453513423"
          assert "GB", "40142431565517", "Sort Code" => "401424", "Account Number" => "31565517"
          assert "NZ", "041587005000000", "Bank Number" => "04", "Branch Number" => "1587", "Account Number" => "0050000", "Suffix" => "00"
          assert "XX", "1234", "Account Number" => "1234"
        end

        it "honors the multiline flag" do
          gb = Formatter.formatted_bank_account_number("40142431565517", "GB")
          expect(gb.to_s).to eq "Sort Code: 401424\nAccount Number: 31565517"

          nz = Formatter.formatted_bank_account_number("041587005000000", "NZ")
          expect(nz.to_s).to eq "Account Number: 04-1587-0050000-00"

          xx = Formatter.formatted_bank_account_number("1234", "XX")
          expect(xx.to_s).to eq "Account Number: 1234" # TODO: support i18n
        end

        it "preserves the given number" do
          number = "484795453513423"
          Formatter.formatted_bank_account_number(number, "AU")

          expect(number).to eq "484795453513423"
        end
      end
    end
  end
end
