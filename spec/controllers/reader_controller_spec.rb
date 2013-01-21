require 'spec_helper'

describe ReaderController do
  describe "GET index" do

  	it 'with type "hotentry"' do
  		get :index, :type => 'hotentry'
  		response.should be_success
  	end
  end

end
