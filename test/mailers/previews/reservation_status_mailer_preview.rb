# Preview all emails at http://localhost:3000/rails/mailers/reservation_status_mailer
class ReservationStatusMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reservation_status_mailer/status_updated
  def status_updated
    ReservationStatusMailer.status_updated
  end

end
