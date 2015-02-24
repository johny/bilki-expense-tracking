module ApplicationHelper

  def payment_method method
    t = ''
    if method == 'card'
      t = 'credit'
    elsif method == 'cash'
      t = 'coin'
    elsif method == 'bank'
      t = 'screen'
    end

    return raw "<span class='icon icon-#{t}'></span>"

  end

  def simple_bill_time day

    if day == Date.today
      "dzisiaj"
    elsif day == Date.today - 1.day
      "wczoraj"
    else
      "#{distance_of_time_in_words_to_now(day)} temu"
    end

  end

end