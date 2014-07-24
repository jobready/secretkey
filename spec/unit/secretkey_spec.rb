require 'spec_helper'

describe SecretKey do

  let!(:key) { Faker::Number.number(15) }
  let!(:secret) { Faker::Bitcoin.address }
  let!(:test_time_stamp) { '201407241253' }
  let!(:generated_token) { Digest::SHA1.hexdigest("#{key}:#{secret}:#{test_time_stamp}") }

  describe '.generate_token' do
    context 'when timestamp is valid' do
      let!(:time_stamp) { Time.new(2014, 07, 24, 12, 53) }
      it 'produces a token' do
        expect(described_class.generate_token(key, secret, time_stamp)).to eq(generated_token)
      end
    end

    context 'when timestamp is invalid' do
      let!(:time_stamp) { 'sometext' }
      it 'raises an invalid timestamp error' do
        expect(lambda { described_class.generate_token(key, secret, time_stamp) }).to raise_error(ArgumentError)
      end
    end
  end

end