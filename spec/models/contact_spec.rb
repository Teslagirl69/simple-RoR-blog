require 'rails_helper'
describe Contact do
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :message }
end
