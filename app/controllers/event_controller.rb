class EventController < ApplicationController
def create_event
  @event=Event.new
   @friends=User.find(current_user.friends.map(&:friend_id))
  if request.post?
   params[:event][:eventusers_attributes].delete_if { |item| item[:user_id]=="0" }
    @event=Event.create(params[:event])
  
  end
end
def event_list
 @event_list=Event.find(current_user.eventusers.map(&:event_id))
@list=Event.paginate :page=>params[:page],:order=>'craeted_at DESC',
                   :per_page=>10
end
def destroy
#@event=current_user.eventusers.find()
@event = Eventuser.destroy(params[:id])

respond_to do |format|
   format.html{redirect_to event_list_path}
end
end
end
