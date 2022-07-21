module AccessCounter
  private

  def access_count
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
  end

  def access_count_reset
    session[:counter] = 0
  end
end
