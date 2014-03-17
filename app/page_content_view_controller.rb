class PageContentViewController < UIViewController
  attr_accessor :pageLabel, :pageIndex, :pageTitle

  def loadView
    super
    self.view = UIView.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @pageLabel = UILabel.alloc.initWithFrame([[0, 100], [self.view.frame.size.width, 40]])
    @pageLabel.font = UIFont.systemFontOfSize(30)
    @pageLabel.textAlignment = UITextAlignmentCenter
    @pageLabel.textColor = UIColor.blackColor
    @pageLabel.backgroundColor = UIColor.clearColor
    self.view.addSubview(@pageLabel)
  end

  def viewDidLoad
    super
    @pageLabel.text = pageTitle
  end
end