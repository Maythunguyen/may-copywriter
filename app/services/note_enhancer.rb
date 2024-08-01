require 'openai'

class NoteEnhancer
  def self.enhance(note)
    new(note).enhance
  end

  def initialize(note)
    @note = note
  end

  def enhance
    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: @note.content.to_plain_text }],
        max_tokens: 100
      }
    )

    if response && response['choices'] && response['choices'][0]
      @note.update(enhanced_content: response['choices'][0]['message']['content'])
    else
      @note.update(enhanced_content: "Error enhancing content")
    end
  rescue => e
    @note.update(enhanced_content: "Error enhancing content: #{e.message}")
  end
end
