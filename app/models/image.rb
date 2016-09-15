class Image < ActiveRecord::Base
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :tagged_users, through: :tags, source: :user
  has_attached_file :img_file, styles: { default: "600x600", thumb: "100x100"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img_file, content_type: /\Aimage\/.*\z/
  validates :img_file_file_name, :presence => true
end
