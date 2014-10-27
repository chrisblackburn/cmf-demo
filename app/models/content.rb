class Content < ActiveRecord::Base
  extend FriendlyId
  after_create :send_approval_notifications

  friendly_id :title, use: [:slugged, :finders]

  def approve!
    update_attributes!(approved_at: Time.now)
  end

  def approved?
    approved_at != nil
  end

  private

  def send_approval_notifications
    AdminUser.where(approver: true).each do |user|
      ContentMailer.approval(user, self).deliver
    end
  end
end
