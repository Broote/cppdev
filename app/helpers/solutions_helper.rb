#  encoding: utf-8

module SolutionsHelper
  def convert_time(time)
      timestamp = time.in_time_zone("Moscow")
      return timestamp.strftime("%e ") + convert_month(timestamp.strftime("%B")) + timestamp.strftime(" %H:%M")
  end

  def convert_month(month)
    case month
      when "January"
        return "Января"
      when "February"
        return "Февраля"
      when "March"
        return "Марта"
      when "April"
        return "Апреля"
      when "May"
        return "Мая"
      when "June"
        return "Июня"
      when "July"
        return "Июля"
      when "August"
        return "Августа"
      when "September"
        return "Сентября"
      when "October"
        return "Октября"
      when "November"
        return "Ноября"
      when "December"
        return "Декабря"
    end
  end
end
