require 'uri'

module ApiGatewayHelpers
  class ApiGateway < Struct.new(:api_id, :region)
    def self.instance
      new(ENV['AWS_API_ID'], ENV['AWS_REGION'])
    end

    def valid?
      !(api_id.nil? || region.nil?)
    end

    def url_for(path)
      URI.join("https://#{api_id}.execute-api.#{region}.amazonaws.com/api/", "./#{path}")
    end
  end

  class NullGateway < Struct.new(:port)
    def self.instance
      new(ENV.fetch('MOCK_GATEWAY_PORT', 4568))
    end

    def url_for(path)
      URI.join("http://localhost:#{port}", path)
    end
  end

  def api_gateway_url(path)
    gateway_url_helper.url_for(path)
  end

  private

  def gateway_url_helper
    @gateway_url_helper ||= if ApiGateway.instance.valid?
      ApiGateway.instance
    else
      NullGateway.instance
    end
  end
end
