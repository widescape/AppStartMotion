class PageContentViewController < UIViewController
  attr_accessor :pageIndex, :pageTitle

  def loadView
    self.view = PageView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def viewDidLoad
    super
    view.pageLabel.text = pageTitle
  end
end