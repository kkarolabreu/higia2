class HomeController < ApplicationController
  def index
    if patient_signed_in?
      @prescriptions = DoctorPrescription.where(patient: current_patient)
      render :patient
    elsif doctor_signed_in?
      render :doctor
    elsif admin_signed_in?
      render :admin
    end
  end
end