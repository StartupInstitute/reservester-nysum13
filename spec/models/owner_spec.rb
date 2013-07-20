require 'spec_helper'

describe Owner do
  it { should respond_to(:name) }
  it { should respond_to(:email)}
end