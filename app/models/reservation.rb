class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  def overlap(check_in1, check_out1, check_in2, check_out2)
    if (check_in2..check_out2).overlap?(check_in1..check_out1)
      flash[:danger] = 'Error, Someone has already booked for these dates'
      render :edit
      else
      flash[:success] = 'Successfully reserved this place'
      redirect_to @listing
  end
end
end
