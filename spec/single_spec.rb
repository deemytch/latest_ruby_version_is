require_relative '../latest_ruby_version_is'

RSpec.describe latest_ruby_version_is do

  it 'all here' do
    expect( latest_ruby_version_is ).to eq '2.7.1'
    expect( latest_ruby_version_is( :local ) ).to eq '2.7.1'
  end

end
