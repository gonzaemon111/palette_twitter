class ApplicationDecorator < Draper::Decorator
  delegate

  def created_at
    object.created_at.strftime("%Y年%m月%d日 %H:%M:%S")
  end

  def updated_at
    object.created_at.strftime("%Y年%m月%d日 %H:%M:%S")
  end
end