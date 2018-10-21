require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'database columns' do
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:resume).of_type(:jsonb) }
  end
end
