class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    tabBar = UITabBarController.alloc.init
    tabBar.viewControllers = [
      UINavigationController.alloc.initWithRootViewController(HomeController.alloc.init),
      UINavigationController.alloc.initWithRootViewController(LogController.alloc.init),
      UINavigationController.alloc.initWithRootViewController(StatsController.alloc.init),
      UINavigationController.alloc.initWithRootViewController(SettingsController.alloc.init)
    ]
    tabBar.selectedIndex = 0
 
    @window.rootViewController = tabBar
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    true
  end

end
