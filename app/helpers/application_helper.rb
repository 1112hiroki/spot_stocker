module ApplicationHelper
  def simple_time(time)
    time.strftime("%Y年%m月%d日(#{%w(日 月 火 水 木 金 土)[time.wday]}) %H:%M")
  end
end
