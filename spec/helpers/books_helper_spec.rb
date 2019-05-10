require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the BooksHelper. For example:
#
# describe BooksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe BooksHelper, type: :helper do
  it "responds successfully" do
      get :index
      expect(response.status).to eq(200)
  end

  it "responds successfully" do
    get :show(params[:id])
    expect(response.status).to eq(200)
  end
end
