class PageView < UIView
  attr_accessor :pageLabel

  def pageLabel
    @pageLabel ||= begin
      l = UILabel.alloc.initWithFrame([[0, 100], [frame.size.width, 40]])
      l.font = UIFont.systemFontOfSize(30)
      l.textAlignment = UITextAlignmentCenter
      l.textColor = UIColor.blackColor
      l.backgroundColor = UIColor.clearColor
      addSubview(l)
      l
    end
  end
end