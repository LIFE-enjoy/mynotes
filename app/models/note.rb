class Note < ApplicationRecord
    has_rich_text :action_text
    belongs_to :user
end
