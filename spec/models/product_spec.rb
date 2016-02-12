require 'spec_helper'

describe Product do
  let(:product) { FactoryGirl.build :product }
  subject { product }

  it { should respond_to(:title) }
  it { should respond_to(:price) }
  it { should respond_to(:published) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }

  it { should_not be_published }

  it { should validate_prescence_of :title }
  it { should validate_prescence_of :price }
  it { should validate_numericality_of(:price).is_greater_than_or_equalt_to(0) }
  it { should validate_prescence_of :user_id }
  
end
