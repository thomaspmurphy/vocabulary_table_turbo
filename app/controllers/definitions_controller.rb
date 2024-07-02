class DefinitionsController < ApplicationController
  include ActionView::RecordIdentifier

  def index
    @definitions = Definition.order(:created_at)
  end

  def create
    @definition = Definition.new(definition_params)
    if @definition.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to definitions_path }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @definition = Definition.find(params[:id])
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(dom_id(@definition), partial: 'definitions/form_row', locals: { definition: @definition })
      end
      format.html { render layout: false }
    end
  end

  def update
    @definition = Definition.find(params[:id])

    if @definition.update(definition_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@definition), partial: 'definitions/form_row', locals: { definition: @definition }) }
        format.html { redirect_to definitions_path }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @definition = Definition.find(params[:id])    

    (10..100).step(10) do |n|
      Turbo::StreamsChannel.broadcast_action_to(
        @definition,
        action: :replace,
        target: dom_id(@definition, :delete),
        partial: "definitions/delete_button", 
        locals: { definition: @definition, progress: "#{n}%" }
      )

    sleep 0.3
    end

    @definition.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to definitions_path }
    end
  end

  private

  def definition_params
    params.require(:definition).permit(:term, :definition)
  end
end
