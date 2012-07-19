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
def mutual
  @user= User.find(params[:id])
users = []
users << current_user.id
users << @user.id
users.flatten!
puts users.inspect

 # @mutual_friends=User.find_by_sql("select firstname,lastname from users where id IN (select friend_id from friends where user_id IN(users) group by friend_id);
#")
  @mutual_friends=User.select('u.firstname,u.id').where(['f.user_id IN (?)',(users)]).
  joins('as u inner join friends as f ON f.friend_id=u.id').group('friend_id HAVING COUNT(friend_id) >=2')

end

end
