class Sql
  def self.like
  	ENV['RAILS_ENV'] != "production" ? "like" : "ilike"
  end
end