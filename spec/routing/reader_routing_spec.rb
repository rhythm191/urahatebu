require 'spec_helper'

describe 'routes to the reader controller' do

	describe 'GET /reader' do
  	it { expect(:get => 'reader/index').to be_routable }
  	it { expect(:get => 'reader/index').to route_to(
      :controller => "reader",
      :action => "index",
      :type => 'hotentry'
    ) }
  end

  describe 'GET /reader' do
  	it { expect(:get => 'reader/hotentry/index').to be_routable }
  	it { expect(:get => 'reader/hotentry/index').to route_to(
      :controller => "reader",
      :action => "index",
      :type => 'hotentry'
    ) }
  end

  describe 'GET /reader/type' do
  	it { expect(:get => '/reader/it/index').to be_routable }
  	it { expect(:get => '/reader/it/index').to route_to(
      :controller => "reader",
      :action => "index",
      :type => 'it'
    ) }
  end
end