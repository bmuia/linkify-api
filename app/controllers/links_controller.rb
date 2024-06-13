class LinksController < ApplicationController
    def create
      @link = Link.new(link_params)
  
      if @link.save
        shortened_url = url_for(controller: 'links', action: 'show', short_code: @link.short_code, only_path: false)
        render json: { short_url: shortened_url }, status: :created
      else
        render json: @link.errors, status: :unprocessable_entity
      end
    end
  
    def show
      @link = Link.find_by_short_code(params[:short_code])
  
      if @link
        redirect_to @link.url, allow_other_host: true
      else
        render json: { error: 'Short URL not found' }, status: :not_found
      end
    end
  
    private
  
    def link_params
      params.require(:link).permit(:url, :short_code)
    end
  end
  