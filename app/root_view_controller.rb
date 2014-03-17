class RootViewController < UIViewController
  attr_accessor :pageViewController
  attr_accessor :pageTitles

  def viewDidLoad
    super

    @pageTitles = %w{First Second Third}

    @pageViewController = UIPageViewController.alloc.init
    @pageViewController.dataSource = self
    @pageViewController.view.frame = UIScreen.mainScreen.bounds

    @pageViewController.setViewControllers([pageContentViewControllerAtIndex(0)], direction:UIPageViewControllerNavigationDirectionForward, animated:false, completion:nil)

    self.addChildViewController(@pageViewController)
    self.view.addSubview(@pageViewController.view)
    @pageViewController.didMoveToParentViewController(self)
  end

  def pageContentViewControllerAtIndex(index)
    return if @pageTitles.count == 0 or index >= @pageTitles.count

    pageContentViewController = PageContentViewController.alloc.init
    pageContentViewController.pageTitle = @pageTitles[index]
    pageContentViewController.view.backgroundColor = UIColor.whiteColor
    pageContentViewController.pageIndex = index

    pageContentViewController
  end

  # Page View Controller Data Source

  def pageViewController(pageViewController, viewControllerBeforeViewController:viewController)
    index = viewController.pageIndex

    return if index == NSNotFound or index == 0

    index -= 1
    pageContentViewControllerAtIndex(index)
  end

  def pageViewController(pageViewController, viewControllerAfterViewController:viewController)
    index = viewController.pageIndex

    return if index == NSNotFound or index >= @pageTitles.count - 1

    index += 1
    pageContentViewControllerAtIndex(index)
  end
end