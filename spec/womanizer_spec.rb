# encoding: utf-8
require 'womanizer'

describe Womanizer do
  let(:text) { 'Kleine Kinder können keine kleinen Kirschkerne knacken' }
  let(:encoded) { subject.encode(text) }
  let(:words) { encoded.split }
  it 'encodes every letter into a case variation' do
    words.should have(text.bytes.length).items
    words.each do |w|
      w.should match(/\Amorewom[ae]n\z/i)
    end
  end

  it 'decodes' do
    recoded = subject.decode( encoded )
    recoded.should == text
  end

  it 'is ruby' do
    subject.define!
    foo = 23
    res = ok moREwoMAn moREwOMAN moREwOMAN
    res.should == 23
  end
end
