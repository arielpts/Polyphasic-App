# encoding: UTF-8

class SettingsController < QuickDialogController

  attr_accessor :dataDict

  include AppHelper
  include BW::KVO

  def init
    if super

      root = QRootElement.alloc.init
      root.title = "Settings"
      root.grouped = true

      cycle = QSection.alloc.initWithTitle "Cycle"
      root.addSection cycle

      pattern = QRadioElement.alloc.initWithItems(Pattern.all, selected: Pattern.default, title: 'Pattern')
      pattern.bind = 'value:pattern'
      cycle.addElement pattern
      cycle.addElement QLabelElement.alloc.initWithTitle("Current Cycle", Value: "1/5")
      cycle.addElement QLabelElement.alloc.initWithTitle("Last Cycle", Value: "00:00")

      alarm = QSection.alloc.initWithTitle "Alarm"
      root.addSection alarm

      alarm.addElement QLabelElement.alloc.initWithTitle("Sound", Value: "Chime 1")
      alarm.addElement QLabelElement.alloc.initWithTitle("Volume", Value: "10/10")
      
      @dataDict = {}

      root.bindToObject @dataDict

      observe(self, :dataDict) do |old_value, new_value|
        puts "Changed from %@, to %@", old_value, new_value
      end      

      self.root = root

      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Settings', image:UIImage.imageNamed('glyphicons_019_cogwheel.png'), tag:1)
    end
    self
  end

end