class BuddyMailer < ApplicationMailer
  def buddy_request
    @buddy = params[:buddy]
    @rockstar_email = @buddy.roadmap.user.email
    @consent_link = params[:consent_link]
    mail(to: @buddy.email, subject: "Do you want to be an accountability buddy for #{@rockstar_email}")
  end

  def reminder_email
    @buddy = params[:buddy]
    @rockstar_email = @buddy.roadmap.user.email
    mail(to: @buddy.email, subject: "Do you want to be an accountability buddy for #{@rockstar_email}")
  end
end
