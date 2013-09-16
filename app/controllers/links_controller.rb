class LinksController < ApplicationController

def index

  @link = Link.new

end

def show
end


def new

@link = Link.new

end

def vote_up
  @link = Link.find(params[:id])

  current_user.up_vote(@link)
  redirect_to pages_path , notice: 'Thanks for voting!'
rescue MakeVoteable::Exceptions::AlreadyVotedError
  flash[:error] = 'Already voted!'
  redirect_to pages_path
end

def vote_down
  @link = Link.find(params[:id])
  current_user.down_vote(@link)
  redirect_to pages_path , notice: 'Thanks for voting!'
rescue MakeVoteable::Exceptions::AlreadyVotedError
  flash[:error] = 'Already voted!'
  redirect_to pages_path
end




def create

    @link = Link.new(params[:link])
    @link.user_id = current_user.id

    respond_to do |format|
      if @link.save
        format.html { redirect_to pages_path , notice: 'Link was successfully created.' }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end

end

def destroy

@link = Link.find(params[:id])
 
@link.destroy
redirect_to root_url

end




end
