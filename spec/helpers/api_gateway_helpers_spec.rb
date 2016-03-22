require 'spec_helper'

RSpec.describe ApiGatewayHelpers do
  include described_class

  describe '#api_gateway_url' do
    let(:api_id) { nil }
    let(:region) { nil }

    before do
      allow(ENV).to receive(:[]).with("AWS_API_ID").and_return(api_id)
      allow(ENV).to receive(:[]).with("AWS_REGION").and_return(region)
    end

    context 'when AWS_API_ID is set in the environment' do
      let(:api_id) { 'api-id' }

      it 'returns a fallback url' do
        expect(api_gateway_url('contact')).to eq(URI("http://localhost:4568/contact"))
      end

      context 'when AWS_REGION is also set in the environment' do
        let(:region) { 'ca-north-pole' }

        it 'returns the api gateway url for an absolute url' do
          expect(api_gateway_url('/contact')).to eq(URI("https://api-id.execute-api.ca-north-pole.amazonaws.com/api/contact"))
        end

        it 'returns the api gateway url for a relative url' do
          expect(api_gateway_url('contact')).to eq(URI("https://api-id.execute-api.ca-north-pole.amazonaws.com/api/contact"))
        end
      end
    end

    context 'when AWS_API_ID is not set in the environment' do
      it 'returns a fallback url' do
        expect(api_gateway_url('contact')).to eq(URI("http://localhost:4568/contact"))
      end
    end
  end
end
