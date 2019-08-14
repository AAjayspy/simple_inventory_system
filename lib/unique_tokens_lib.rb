# frozen_string_literal: true

module UniqueTokensLib
  def generate_token(count)
    SecureRandom.base64(count).tr('+/=', '0aZ').strip.delete("\n")
  end
end
