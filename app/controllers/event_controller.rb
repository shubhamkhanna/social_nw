class EventController < ApplicationController
def create_event
  @event=Event.new
  if request.post?
  
  @event=Event.create(params[:event])
    
    end
end
def select_friends
@friends=User.find(current_user.friends.map(&:friend_id))
end
end
