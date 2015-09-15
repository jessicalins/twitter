class Tweet < ActiveRecord::Base
  after_create :check_mention
  after_destroy :destroy_mention
  has_many :mentions
  belongs_to :user
  validates :content, presence: true, length: { maximum: 140 }

  def check_mention
    #allowed_symbols = ""
    mentions = self.content.scan(/(@\w+)/).uniq
    mentions.each do |mention|
      user = User.where(username: mention.first.tr('@',''))
      Mention.create(user_id: user.first.id, tweet_id: self.id) if user.exists?
    end
  end

  def destroy_mention
    Mention.where(tweet_id: self.id).destroy_all
  end
end
