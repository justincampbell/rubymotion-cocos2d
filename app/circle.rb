class Circle < CCNode
  def draw
    glColor4f 255, 255, 255, 255

    center = [0.0, 0.0]
    radius = 25.0
    angle = 0.0
    segments = radius
    drawLineToCenter = false

    ccDrawCircle center, radius, angle, segments, drawLineToCenter
  end
end
