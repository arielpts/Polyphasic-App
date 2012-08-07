# encoding: UTF-8

class LogController < QuickDialogController

  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Log', image:UIImage.imageNamed('glyphicons_057_history.png'), tag:1)
    end
    self
  end

end
