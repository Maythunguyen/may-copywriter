class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = current_user.notes
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      enhance_content(@note)
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  def update
    if @note.update(note_params)
      enhance_content(@note)
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end

  private

  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :enhanced_content)
  end

  def enhance_content(note)
    begin
      client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: note.content.to_plain_text }],
          max_tokens: 100
        }
      )
  
      if response && response['choices'] && response['choices'][0]
        note.update(enhanced_content: response['choices'][0]['message']['content'])
      else
        note.update(enhanced_content: "Error enhancing content")
      end
    rescue => e
      note.update(enhanced_content: "Error enhancing content: #{e.message}")
    end
  end
end
