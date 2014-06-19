class TeamsController < ApplicationController
  def index
    puts "--------------------------------------------"
    @teams = current_user.
      github_client.
      user_teams.
      sort {|a,b| a["organization"]["login"] <=> b["organization"]["login"] }
  end
end
