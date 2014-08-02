require 'womanizer'

describe Womanizer do
  it 'encodes' do
    subject.encode("foo").should match(/(?:women ){2}women/i)
  end
  it 'decodes' do
    encoded = subject.encode('foo')
    subject.decode( encoded ).should == 'foo'
  end
end
