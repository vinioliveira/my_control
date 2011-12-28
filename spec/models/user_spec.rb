require 'spec_helper'

describe User do
  def mock_user(stubs={})
    @mock_user = Factory.create(:user, stubs)
  end
end
