# encoding: UTF-8

class HomeController < QuickDialogController

  include AppHelper

  def init
    if super

      root = QRootElement.alloc.init
      root.title = "Polyphasic"
      root.grouped = true

      stats = QSection.alloc.initWithTitle "Stats"
      stats.addElement QLabelElement.alloc.initWithTitle("Today", Value: "95% (15m+)")
      stats.addElement QLabelElement.alloc.initWithTitle("This Week", Value: "97% (2h-)")
      stats.addElement QLabelElement.alloc.initWithTitle("This Month", Value: "95% (16h+)")
      root.addSection stats

      cycle = QSection.alloc.init
      cycle.addElement QLabelElement.alloc.initWithTitle("Next Cycle in", Value: "02:32:10")
      root.addSection cycle

      actions = QSection.alloc.init
      button = QButtonElement.alloc.initWithTitle "Sleep Now!"
      actions.addElement button
      root.addSection actions

      self.root = root

      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Home', image:UIImage.imageNamed('glyphicons_020_home.png'), tag:1)
    end
    self
  end
end