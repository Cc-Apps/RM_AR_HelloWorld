class GameViewController < UIViewController
  attr_accessor :scene_view

  def viewDidLoad
    super

    NSLog("RM_AR_DEBUG viewDidLoad")

    self.view = arsk_view
    @scene_view = arsk_view
    @scene_view.delegate = self

    @game_scene = GameScene.sceneWithSize(arsk_view.size)
    @game_scene.scaleMode = SKSceneScaleModeAspectFit

    arsk_view.presentScene(@game_scene)

    arsk_view.showsFPS = true
    arsk_view.showsNodeCount = true
  end

  def arsk_view
    @arsk_view ||= ARSKView.alloc.initWithFrame(screen_rect)
  end

  def prefersStatusBarHidden
    true
  end

  def viewWillAppear(animated)
    super(animated)

    NSLog("RM_AR_DEBUG viewWillAppear")

    configuration = ARWorldTrackingConfiguration.new
    @scene_view.session.runWithConfiguration(configuration)
  end

  def viewWillDisappear(animated)
    super(animated)

    NSLog("RM_AR_DEBUG viewWillDisappear")

    @scene_view.session.pause
  end

  # ARSKViewDelegate

  def view(view, nodeForAnchor: anchor)
    puts "View delegate called"
  end

  def session(session, didFailWithError: error)
    NSLog("RM_AR_DEBUG Error: #{error.inspect}")
  end

  def sessionWasInterrupted(session)
    NSLog("RM_AR_DEBUG Interrupted")
  end

  def sessionInterruptionEnded(session)
    NSLog("RM_AR_DEBUG Interruption ended")
  end

  # Screen Helpers

  def device_screen_width
    UIScreen.mainScreen.bounds.size.width
  end

  def device_screen_height
    UIScreen.mainScreen.bounds.size.height
  end

  def screen_rect
    CGRectMake(0, 0, device_screen_width, device_screen_height)
  end
end