# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rent do
  subject(:rent) { create(:rent) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:book) }
  it { is_expected.to validate_presence_of(:startDate) }
  it { is_expected.to validate_presence_of(:endDate) }
end
