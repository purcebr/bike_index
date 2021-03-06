class CycleType < ActiveRecord::Base
  # Defines things like unicycles and recumbent
  include FriendlySlugFindable
  def self.old_attr_accessible
    %w(name slug).map(&:to_sym).freeze
  end

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  has_many :bikes

  def self.bike
    CycleType.first_or_create(name: 'Bike', slug: 'bike')
  end
end
