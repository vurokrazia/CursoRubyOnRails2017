# Preview all emails at http://localhost:3000/rails/mailers/info_mailer
class InfoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/info_mailer/form_contact
  def form_contact
    InfoMailer.form_contact
  end

end
