require 'spec_helper'

describe SecretKey::SecretKey do

  let!(:key) { Faker::Number.number(15) }
  let!(:secret) { Faker::Bitcoin.address }

  describe '#token' do
    context 'when timestamp is not provided' do
      let(:secret_key) { described_class.new(key, secret) }
      let(:timestamp) { secret_key.timestamp }
      let(:expected_token) { Digest::SHA1.hexdigest("#{key}:#{secret}:#{timestamp}") }
      it 'produces a valid token' do
        expect(secret_key.token).to eq(expected_token)
      end
    end

    context 'when timestamp is provided' do
      let(:timestamp) { Time.new(2014, 07, 24, 16, 54, 00).to_i }
      let(:secret_key) { described_class.new(key, secret, timestamp: timestamp) }
      let(:expected_token) { Digest::SHA1.hexdigest("#{key}:#{secret}:#{timestamp}") }

      it 'produces a valid token' do
        expect(secret_key.token).to eq(expected_token)
      end
    end
  end

end