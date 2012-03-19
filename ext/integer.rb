class Integer
  def position_suffix
    if (11..13).include? (self % 100)
      "th"
    else
      case to_s[-1]
      when "1" then "st"
      when "2" then "nd"
      when "3" then "rd"
      else "th"
      end
    end
  end
end
