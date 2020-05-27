require 'rails_helper'

RSpec.describe PermitSubmission, type: :model do
  subject do
    described_class.new(name: 'Anything',
                        agency: 'Lorem ipsum',
                        status: 'filed',
                        deadline: Date.today)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
