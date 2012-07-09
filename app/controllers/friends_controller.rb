class FriendsController < ApplicationController
    def add_friends
    #@friends=User.find(params[:user_id])
    if request.post?
       current_user.friends.build(:user_id=>current_user.id,:friend_id=>params[:friend_id])
        current_user.save
        respond_to do |format|
          format.js
        end
     end
    end
def all_friends
@friends=User.find(current_user.friends.map(&:friend_id))

end
  end
