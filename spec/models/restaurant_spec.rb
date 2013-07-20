require 'spec_helper'

describe Restaurant do
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:phone) }

end