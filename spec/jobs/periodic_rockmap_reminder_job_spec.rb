require 'rails_helper'

RSpec.describe PeriodicRockmapReminderJob, type: :job do
  let!(:user) { user_with_roadmap(last_motivator_date, reminder_period_days) }
  subject(:rockmap_reminder) { described_class.new }

  context 'when the reminder job is run today' do
    context 'with a reminder period greater than last motivator date' do
      let(:last_motivator_date) { Date.yesterday }
      let(:reminder_period_days) { 5 }
      it 'does not send' do
        expect { rockmap_reminder.perform }
          .to_not have_enqueued_job(ActionMailer::MailDeliveryJob)
      end
    end

    context 'with a reminder period smaller than last motivator date' do
      let(:last_motivator_date) { Date.today - 3 }
      let(:reminder_period_days) { 1 }
      it 'does not send' do
        expect { rockmap_reminder.perform }
          .to_not have_enqueued_job(ActionMailer::MailDeliveryJob)
      end
    end

    context 'with a reminder that hits the last motivator date' do
      let(:last_motivator_date) { Date.yesterday }
      let(:reminder_period_days) { 1 }
      it 'does not send' do
        expect { rockmap_reminder.perform }
          .to have_enqueued_job(ActionMailer::MailDeliveryJob)
                .with('UserMailer', 'reminder_email', 'deliver_now', params: {user: user}, args: [])
      end
    end

  end

  describe '#days_since_last_reminder' do
    let(:reminder_period_days) { 1 }
    context 'when last reminder was yesterday' do
      let(:last_motivator_date) { Date.yesterday }
      it 'returns 1' do
        days_passed = rockmap_reminder.send(:days_since_last_reminder, user)
        expect(days_passed).to eq 1
      end
    end

    context 'when last reminder was 66 days ago' do
      let(:last_motivator_date) { Date.today - 66 }
      it 'returns 66' do
        days_passed = rockmap_reminder.send(:days_since_last_reminder, user)
        expect(days_passed).to eq 66
      end
    end

    context 'when last reminder was today' do
      let(:last_motivator_date) { Date.today }
      it 'returns 0' do
        days_passed = rockmap_reminder.send(:days_since_last_reminder, user)
        expect(days_passed).to eq 0
      end
    end
  end

  describe '#email_due?' do
    context 'when reminder period is 0' do
      let(:last_motivator_date) { Date.today - rand(10) }
      let(:reminder_period_days) { 0 }
      it 'never returns true' do
        email_due = rockmap_reminder.send(:email_due?, user)
        expect(email_due).to eq false
      end
    end

    context 'when reminder period is 1' do
      let(:reminder_period_days) { 1 }
      context 'and last reminder was yesterday' do
        let(:last_motivator_date) { Date.yesterday }
        it 'returns true' do
          email_due = rockmap_reminder.send(:email_due?, user)
          expect(email_due).to eq true
        end
      end

      context 'and last reminder was today' do
        let(:last_motivator_date) { Date.today }
        it 'returns false' do
          email_due = rockmap_reminder.send(:email_due?, user)
          expect(email_due).to eq false
        end
      end
    end

    context 'when reminder period is 5' do
      let(:reminder_period_days) { 5 }
      context 'and last reminder was yesterday' do
        let(:last_motivator_date) { Date.yesterday }
        it 'returns false' do
          email_due = rockmap_reminder.send(:email_due?, user)
          expect(email_due).to eq false
        end
      end
    end
  end
end
