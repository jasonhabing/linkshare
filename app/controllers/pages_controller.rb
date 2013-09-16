class PagesController < ApplicationController


def index

if signed_in?

@links = Link.order("id DESC").all
@link = Link.new
@feedlinks = Link.from_users_followed_by(current_user).order("id DESC").all

end
end


def feedlinks

Link.from_users_followed_by.(current_user)

end



end
