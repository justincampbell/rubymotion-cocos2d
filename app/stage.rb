class Stage < CCLayer
  FRAME_TIME = 1.0/60
  WIDTH = UIScreen.mainScreen.bounds.size.width
  HEIGHT = UIScreen.mainScreen.bounds.size.height
  SPEED = 5.0
  RADIUS = 25.0

  def onEnter
    setup_scene

    timer { update }

    super
  end

  def setup_scene
    @circle = Circle.node
    @circle.setPosition [WIDTH / 2, HEIGHT / 2]
    addChild @circle
  end

  def update(time = FRAME_TIME)
    move_circle
  end

  def move_circle
    @velocity ||= [SPEED, SPEED]

    x = @circle.position.x
    y = @circle.position.y

    @velocity[0] = SPEED if x <= RADIUS
    @velocity[0] = -SPEED if x >= WIDTH - RADIUS
    @velocity[1] = SPEED if y <= RADIUS
    @velocity[1] = -SPEED if y >= HEIGHT - RADIUS

    x += @velocity[0]
    y += @velocity[1]

    @circle.setPosition [x, y]
  end

  def timer(&block)
    NSTimer.scheduledTimerWithTimeInterval FRAME_TIME,
      target: block,
      selector: :call,
      userInfo: nil,
      repeats: true
  end
end
