class Item < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true
  validate :image_type
  validate :image_count

  has_many_attached :images
  belongs_to :user
  has_many :conversations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :transact

  # crop image to 300x300px and center
  def thumbnail(img)
    images[img].variant(combine_options: { thumbnail: '300x300^', gravity: 'center', extent: '300x300' })
  end

  private

  def image_type
    errors.add(:images, 'are missing!') if images.attached? == false

    images.each do |image|
      errors.add(:images, 'need to be of the following format: JPEG, JPG, or PNG') unless image.content_type.in?(%('image/jpeg image/jpg image/png'))
    end
  end

  def image_count
    errors.add(:images, 'should be maximum of 5.') if images.count >= 5
  end

  def image_filesize
    images.each do |image|
      errors.add(:images, 'file size should not exceed 1 MB!') if image.byte_size >= 1.megabyte
    end
  end
end
