class AppDelegate
  def application(application, didFinishLaunchingWithOptions: launchOptions)
    UIApplication.sharedApplication.setStatusBarHidden true,
      withAnimation: UIStatusBarAnimationFade

    window.addSubview navigation_controller.view
    window.makeKeyAndVisible

    director.pushScene Stage.node

    true
  end

  def director
    return @director if @director

    @director = CCDirector.sharedDirector

    @director.animationInterval = 1.0/60
    @director.delegate = self
    @director.displayStats = true
    @director.enableRetinaDisplay true
    @director.projection = KCCDirectorProjection2D
    @director.view = glView
    @director.wantsFullScreenLayout = true

    @director 
  end

  def glView
    @glView ||= CCGLView.viewWithFrame window.bounds,
      pixelFormat: KEAGLColorFormatRGB565,
      depthFormat: 0,
      preserveBackbuffer: false,
      sharegroup: nil,
      multiSampling: false,
      numberOfSamples: 0
  end

  def navigation_controller
    return @navigation_controller if @navigation_controller

    @navigation_controller = UINavigationController.alloc.initWithRootViewController director

    @navigation_controller.navigationBarHidden = true

    @navigation_controller
  end

  def window
    @window ||= UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
  end

  def applicationWillResignActive(application)
    p :applicationWillResignActive
    # director.pause if navigation_controller.visibleViewController == director
  end

  def applicationlicationDidBecomeActive(application)
    p :applicationlicationDidBecomeActive
    director.resume if navigation_controller.visibleViewController == director
  end

  def applicationlicationDidEnterBackground(application)
    p :applicationlicationDidEnterBackground
    director.stopAnimation if navigation_controller.visibleViewController == director
  end

  def applicationlicationWillEnterForeground(application)
    p :applicationlicationWillEnterForeground
    director.startAnimation if navigation_controller.visibleViewController == director
  end

  def applicationlicationWillTerminate(application)
    p :applicationlicationWillTerminate
    director.end
  end

  def applicationlicationDidReceiveMemoryWarning(application)
    p :applicationlicationDidReceiveMemoryWarning
    director.purgeCachedData
  end

  def applicationlicationSignificantTimeChange(application)
    p :applicationlicationSignificantTimeChange
    director.setNextDeltaTimeZero true
  end
end
