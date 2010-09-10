Mongoid.configure do |config|
    name = "myapp"
    host = "localhost"
    config.master = Mongo::Connection.new.db(name)
    config.persist_in_safe_mode = false
end

class Page
    include Mongoid::Document
    field :content
    field :slug
    field :categories, :type => Array
    field :head_title
    field :meta_desc
    field :meta_keywords, :type => Array
    field :created_at, :type => DateTime
    field :updated_at, :type => DateTime

    validates_uniqueness_of :slug

    before_create :set_timestamps
    before_update :set_updated

    protected

    def set_timestamps
        self.created_at = Time.now
    end

    def set_updated
        self.updated_at = Time.now
    end
end
