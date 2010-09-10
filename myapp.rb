require "mongoid"
require "classes/helpers"
require "classes/models.rb"

helpers { include Helpers }

# presents an edit screen using TinyMCE as the editor
# JUST LIKE Freakin' WordPress
get "/edit/*" do
    @page = Page.where(:slug => params[:splat].to_s).first
    erb :edit
end

post "/update" do
    @page = Page.where(:slug => params[:page][:slug]).first
    if @page.update_attributes(params[:page])
        #redirect to somewhere
    else
        #set a flash message and redirect back
    end
end

get "/create/*" do
    @page = Page.new( :slug => params[:splat].to_s )
    if @page.save
        redirect_to "/#{page.slug}"
    else
        # go back to somewhere?
    end
end

get '/*' do
 #find document by slug
    @page = Page.where(:slug => params[:splat].to_s).first 
    halt 401, "it ain't there" if @page.blank?
  erb :index
end
