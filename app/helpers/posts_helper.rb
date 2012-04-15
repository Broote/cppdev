module PostsHelper
  def posttime(timestamp)
     timestamp.strftime("%d-%m-%Y %H:%M")
  end
end
