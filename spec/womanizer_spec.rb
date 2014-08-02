require 'womanizer'

describe Womanizer do
  it 'encodes' do
    subject.encode("foo").should == 'moREwoMAn moREwOMAN moREwOMAN'
  end

  it 'decodes' do
    encoded = subject.encode('foo')
    subject.decode( encoded ).should == 'foo'
  end

  it 'is ruby' do
    subject.define!
    foo = 23
    res = moREwoMAn moREwOMAN moREwOMAN
    res.should == 23
  end
end
