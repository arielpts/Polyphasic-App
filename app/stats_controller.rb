# encoding: UTF-8

class StatsController < QuickDialogController

  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Stats', image:UIImage.imageNamed('glyphicons_040_stats.png'), tag:1)
    end
    self
  end

end
