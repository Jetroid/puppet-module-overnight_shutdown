require 'spec_helper'
describe 'overnight_shutdown' do

  context 'with defaults for all parameters' do
    it { should contain_class('overnight_shutdown') }
  end
end
