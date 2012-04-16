require 'date'
class Date
  def week_range
    (self - self.wday .. self + (7 - self.wday) )
  end
end

class Planner
  def  initialize
    week = Date.today.week_range
    @dates = Hash[  week.map{|d| d.strftime("%A")}.zip(week.to_a)  ]
    @days  = {}
  end

  def [](day)
    @days[day.capitalize]
  end

  def []=(day, data)
    day.capitalize!
    unless @days[day]
      @days[day] = [data]
    else
      @days[day] << data
    end
  end

  def planned?(day)
    @days.include? day.capitalize
  end

  def dump
    File.open("#{Date.today.cweek}.agenda", 'w') do |f|
      @dates.each do |day, date|
        if planned?(day)
          f << "#{date.to_s}: #{@days[day].join(",")}\n"
        end
      end
    end
  end
end

class REPL
  def self.start
    week = Planner.new
    loop do
      print "agenda> "
      day = gets.chomp
      is_query = day.end_with?("?")

      break if day.downcase.eql?("exit")

      day.gsub!('?', '')

      unless is_query
        unless week.planned?(day)
          print "what are you doing on #{day}?> "
        else
          print "what else are you doing on #{day}?> "
        end

        activity = gets.chomp

        week[day] = activity
      else
        if week.planned?(day)
          puts "On #{day} you have #{week[day].join(", ")}"
        else
          puts "You have nothing on #{day}"
        end
      end
    end

    week.dump
  end
end

REPL.start
