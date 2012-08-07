module AppHelper

  def load_nib_view(name, view_i = 0)
    @nib_files ||= {}
    views = @nib_files[name] ||= NSBundle.mainBundle.loadNibNamed(name, owner:app, options:nil)
    views[view_i]
  end

  def app
    UIApplication.sharedApplication.delegate
  end

  def window
    app.window
  end

  def map_with_tag(fields, start = 0)
    fields.each.with_index.inject({}) do |controls, (name, i)|
      controls[name] = view.viewWithTag(i + start)
      controls
    end
  end

  def on_touch(e, action)
    e.addTarget self, action: "#{action.to_s}:", forControlEvents:UIControlEventTouchUpInside
  end

  def busy!(visibility = true)
    if visibility
      target = self.view.superview.is_a?(UIViewControllerWrapperView) ? app.navigation_controller.view : self.view
      DejalBezelActivityView.activityViewForView target, withLabel: nil
    else
      DejalBezelActivityView.removeView
    end
  end

end