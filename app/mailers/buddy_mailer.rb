class BuddyMailer < ApplicationMailer
  def buddy_request
    puts 'SEEEENDD'
    @buddy = params[:buddy]
    @rockstar_email = @buddy.roadmap.user.email
    mail(to: @buddy.email, subject: "Do you want to be an accountability buddy for #{@rockstar_email}")
  end

  def reminder_email
    @buddy = params[:buddy]
    @rockstar_email = @buddy.roadmap.user.email
    mail(to: @buddy.email, subject: "Do you want to be an accountability buddy for #{@rockstar_email}")
  end
end
