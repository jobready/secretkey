require 'spec_helper'

describe SecretKey::SecretKey do

  let!(:key) { Faker::Number.number(15) }
  let!(:secret) { Faker::Bitcoin.address }
  let!(:test_timestamp) { Time.new(2014, 07, 24, 12, 53).to_i }
  let!(:generated_token) { Digest::SHA1.hexdigest("#{key}:#{secret}:#{test_timestamp}") }

  describe '.generate_token' do
    context 'when timestamp is valid' do
      let!(:timestamp) { Time.new(2014, 07, 24, 12, 53).to_i }
      it 'produces a token' do
        expect(described_class.generate_token(key, secret, timestamp)).to eq(generated_token)
      end
    end

    context 'when timestamp is invalid' do
      let!(:timestamp) { 'sometext' }
      it 'raises an invalid timestamp error' do
        expect(lambda { described_class.generate_token(key, secret, timestamp) }).to raise_error(ArgumentError, 'Time Stamp is not a valid integer.')
      end
    end
  end

end